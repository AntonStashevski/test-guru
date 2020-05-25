# frozen_string_literal: true

class User < ApplicationRecord
  # принимает в качестве аргумента значение уровня сложности и возвращает список
  # всех Тестов, которые проходил Пользователь на этом уровне сложности
  has_many :tests
  has_many :tests_user
  has_many :users, through: :tests_user
  def passed_tests_by_level(difficulty)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where('results.user_id = ? AND tests.difficulty = ?', id, difficulty)
  end
end
