class Question < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :exam_questions, answers, dependent: :destroy
end
