# frozen_string_literal: true

class Test < ApplicationRecord
  # возвращает отсортированный по убыванию массив названий всех Тестов у которых
  # Категория называется определённым образом (название категории передается в метод в качестве аргумента).
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_user
  has_many :tests, through: :tests_user
  def self.sort_test_by_cat_name(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.name = ?', category).order(title: :desc).pluck(:title)
  end
end
