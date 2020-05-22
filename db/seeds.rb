# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

Category.create(name: 'Backend')
Category.create(name: 'Frontend')
Category.create(name: 'Machine Learning')

Test.create(title: 'PHP', difficulty: 1, category_id: 1)
Test.create(title: 'RubyOnRails', difficulty: 2, category_id: 1)
Test.create(title: 'CSS', difficulty: 0, category_id: 2)
Test.create(title: 'HTML', difficulty: 0, category_id: 2)
Test.create(title: 'Python', difficulty: 1, category_id: 3)

Question.create(body: 'Что такое short tags и как его использовать в PHP?', test_id: 1)
Question.create(body: 'Как изолировать PHP код от HTML? Для чего это нужно?', test_id: 1)
Question.create(body: 'Вопрос по ROR №1', test_id: 2)
Question.create(body: 'Вопрос по ROR №2', test_id: 2)
Question.create(body: 'Вопрос по CSS №1', test_id: 3)
Question.create(body: 'Вопрос по CSS №2', test_id: 3)
Question.create(body: 'Вопрос по HTML №1', test_id: 4)
Question.create(body: 'Вопрос по HTML №2', test_id: 4)
Question.create(body: 'Вопрос по Python №1', test_id: 5)
Question.create(body: 'Вопрос по Python №2', test_id: 5)

Answer.create(body: 'short tags - это короткий синтаксис позволяющий использовать <? и тем самым сократить запись', question_id: 1, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 1, correct: false)

Answer.create(body: 'Изолирование кода необходимо для использования смешанного содержимого скрипта: php, javascript, css и т.п.', question_id: 2, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 2, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 3, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 3, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 4, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 4, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 5, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 5, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 6, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 6, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 6, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 6, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 7, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 7, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 8, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 8, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 9, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 9, correct: false)

Answer.create(body: 'Правильный ответ', question_id: 10, correct: true)
Answer.create(body: 'неправильный ответ', question_id: 10, correct: false)

User.create(name: 'Anton', password: '123456', role: 0)
User.create(name: 'Gena', password: '123456', role: 1)
User.create(name: 'Sveta', password: '123456', role: 1)

Result.create(test_id: 1, user_id: 1)
Result.create(test_id: 2, user_id: 1)
Result.create(test_id: 3, user_id: 1)
Result.create(test_id: 4, user_id: 2)
Result.create(test_id: 5, user_id: 2)
Result.create(test_id: 1, user_id: 3)
