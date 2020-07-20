# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  # принимает в качестве аргумента значение уровня сложности и возвращает список
  # всех Тестов, которые проходил Пользователь на этом уровне сложности
  has_many :created_tests, class_name: :Test, foreign_key: :user_id # список тестов созданных пользователем
  has_many :test_passages # между тестами и проходящими их пользователей
  has_many :tests, through: :test_passages # между тестами и проходящими их пользователей
  has_many :users_badge
  has_many :badges, through: :users_badge
  has_many :gists

  validates :email, uniqueness: true
  validates :email, presence: true

  def user_tests(level)
    tests.where(difficulty: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
