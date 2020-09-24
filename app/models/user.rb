class User < ApplicationRecord
  has_many :posts, questions, topics, exams, dependent: :destroy

  enum role: {trainee: 0, trainer: 1}
  enum type: {ruby: 0, php: 1, android: 2}
  enum gender: {male: 0, female: 1, other: 2}
  enum status: {unactive: 0, active: 1}
end
