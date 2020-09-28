class User < ApplicationRecord
  USER_PERMIT = %i(name email password password_confirmation).freeze
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

  private

  def downcase_email
    email.downcase!
  end
end
