class Exam < ApplicationRecord
  belongs_to :user
  has_many :excercises, exam_questions, dependent: :destroy

  enum type: {ruby: 0, php: 1, android: 2}
end
