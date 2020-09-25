class Exam < ApplicationRecord
  belongs_to :user
  has_many :excercises, dependent: :destroy
  has_many :exam_questions, dependent: :destroy

  enum language: {ruby: 0, php: 1, android: 2}
end
