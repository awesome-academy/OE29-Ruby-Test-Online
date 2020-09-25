class Question < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :exam_questions, dependent: :destroy
  has_many :answers, dependent: :destroy
end
