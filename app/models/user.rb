class User < ApplicationRecord
  USER_PERMIT = %i(name email password password_confirmation).freeze

  attr_accessor :remember_token, :activation_token, :reset_token

  has_many :posts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :exams, dependent: :destroy

  accepts_nested_attributes_for :questions

  validates :name, presence: true,
    length: {maximum: Settings.user.validate.name_max}
  validates :email, presence: true,
    length: {maximum: Settings.user.validate.email_max},
    format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :password, presence: true,
    length: {minimum: Settings.user.validate.pass_min}, allow_nil: true

  has_secure_password

  before_save :downcase_email
  before_create :create_activation_digest

  enum role: {trainee: 0, trainer: 1}
  enum language: {ruby: 0, php: 1, android: 2}
  enum gender: {male: 0, female: 1, other: 2}
  enum status: {unactive: 0, active: 1}

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_columns remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_columns remember_digest: nil
  end

  def activate
    update_columns status: active!, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < Settings.user.time_expired.hours.ago
  end

  private

  def downcase_email
    email.downcase!
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
