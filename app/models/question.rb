class Question < ApplicationRecord
  belongs_to :test # между тестами и вопросами
  has_many :answers # между вопросами и ответами

  validates :body, presence: true
end
