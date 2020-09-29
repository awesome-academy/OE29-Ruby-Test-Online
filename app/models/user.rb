class User < ApplicationRecord
  USER_PERMIT = %i(name email password password_confirmation).freeze

  attr_accessor :remember_token

  has_many :posts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.user.validate.name_max}
  validates :email, presence: true,
    length: {maximum: Settings.user.validate.email_max},
    format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :password, presence: true,
    length: {minimum: Settings.user.validate.pass_min}, allow_nil: true

  has_secure_password

  before_save :downcase_email

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

  def authenticated? remember_token
    return false unless remember_digest

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_columns remember_digest: nil
  end

  private

  def downcase_email
    email.downcase!
  end
end
