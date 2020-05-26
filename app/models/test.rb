# frozen_string_literal: true

class Test < ApplicationRecord
  # возвращает отсортированный по убыванию массив названий всех Тестов у которых
  # Категория называется определённым образом (название категории передается в метод в качестве аргумента).
  belongs_to :category # между тестами и категориями
  has_many :questions # между тестами и вопросами
  belongs_to :creator, class_name: :User, foreign_key: :user_id # Между Тестом и автором (Пользователем), который его создал.
  has_many :tests_user # между тестами и проходящими их пользователей
  has_one :users, through: :tests_user # между тестами и проходящими их пользователей
  def self.sort_test_by_cat_name(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.name = ?', category).order(title: :desc).pluck(:title)
  end
end
