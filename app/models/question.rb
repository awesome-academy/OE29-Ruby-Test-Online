class Question < ApplicationRecord
  QUESTION_PERMIT = [:question, :topic_id, :role,
                    answers_attributes: [:id, :content,
                                        :check, :_destroy].freeze].freeze

  belongs_to :topic
  belongs_to :user
  has_many :exam_questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  enum role: {multi: 0, one: 1}

  delegate :name, to: :topic, prefix: true
  delegate :name, to: :user, prefix: true

  validates :question, presence: true,
    length: {maximum: Settings.answer.validate.content}
  validates :topic_id, presence: true
  validates :user_id, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true

  scope :by_answers, ->(answer_ids){where answer_ids: answer_ids}
end
