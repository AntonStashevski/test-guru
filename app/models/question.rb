# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test # между тестами и вопросами
  has_many :answers # между вопросами и ответами
  has_many :gists

  validates :body, presence: true
end
