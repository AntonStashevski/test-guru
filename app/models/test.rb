# frozen_string_literal: true

class Test < ApplicationRecord
  # возвращает отсортированный по убыванию массив названий всех Тестов у которых
  # Категория называется определённым образом (название категории передается в метод в качестве аргумента).
  belongs_to :category # между тестами и категориями
  belongs_to :creator, class_name: :User, foreign_key: :user_id # Между Тестом и автором (Пользователем), который его создал.
  has_many :questions # между тестами и вопросами
  has_many :tests_user # между тестами и проходящими их пользователей
  has_many :users, through: :tests_user # между тестами и проходящими их пользователей

  scope :easy_tests, -> { where(difficulty: 0..1) }
  scope :medium_tests, -> { where(difficulty: 2..4) }
  scope :hard_tests, -> { where(difficulty: 5..Float::INFINITY) }

  scope :test_by_category_name, ->(category_name) { joins(:category).where(categories: { title: category_name }) }

  validates :difficulty, numericality: { only_integer: true, greater_than: 0, message: "Значение difficulty должно быть целым положительным числом" }
  validates :title, presence: true, uniqueness: { scope: :difficulty, message: "Тест с таким title и difficulty уже существует" }

end
