# frozen_string_literal: true

class User < ApplicationRecord
  # принимает в качестве аргумента значение уровня сложности и возвращает список
  # всех Тестов, которые проходил Пользователь на этом уровне сложности
  has_many :created_tests, class_name: :Test, foreign_key: :user_id # список тестов созданных пользователем
  has_many :tests_user # между тестами и проходящими их пользователей
  has_many :tests, through: :tests_user # между тестами и проходящими их пользователей

  def passed_tests_by_level(difficulty)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where('results.user_id = ? AND tests.difficulty = ?', id, difficulty)
  end
end
