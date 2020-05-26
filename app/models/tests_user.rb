class TestsUser < ApplicationRecord
  belongs_to :user # между тестами и проходящими их пользователей
  belongs_to :test # между тестами и проходящими их пользователей
end