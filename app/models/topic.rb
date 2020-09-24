class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts, questions, dependent: :destroy

  enum type: {ruby: 0, php: 1, android: 2}
end
