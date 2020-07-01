# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test # между тестами и вопросами
  has_many :answers, dependent: :destroy # между вопросами и ответами
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
