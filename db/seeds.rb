# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

category1 = Category.create(title: 'Backend')
category2 = Category.create(title: 'Frontend')
category3 = Category.create(title: 'Machine Learning')

user1 = User.create(name: 'Anton', password: '123456', role: 0, email: 'anton@gmail.com')
user2 = User.create(name: 'Gena', password: '123456', role: 1, email: 'gena@gmail.com')
user3 = User.create(name: 'Sveta', password: '123456', role: 1, email: 'sveta@gmail.com')

test1 = Test.create(title: 'PHP', difficulty: 2, category_id: category1.id, user_id: user1.id)
test2 = Test.create(title: 'RubyOnRails', difficulty: 3, category_id: category1.id, user_id: user2.id)
test3 = Test.create(title: 'CSS', difficulty: 1, category_id: category2.id, user_id: user2.id)
test4 = Test.create(title: 'HTML', difficulty: 1, category_id: category2.id, user_id: user2.id)
test5 = Test.create(title: 'Python', difficulty: 2, category_id: category3.id, user_id: user3.id)

question1 = Question.create(body: 'Что такое short tags и как его использовать в PHP?', test_id: test1.id)
question2 = Question.create(body: 'Как изолировать PHP код от HTML? Для чего это нужно?', test_id: test1.id)
question3 = Question.create(body: 'Вопрос по ROR №1', test_id: test2.id)
question4 = Question.create(body: 'Вопрос по ROR №2', test_id: test2.id)
question5 = Question.create(body: 'Вопрос по CSS №1', test_id: test3.id)
question6 = Question.create(body: 'Вопрос по CSS №2', test_id: test3.id)
question7 = Question.create(body: 'Вопрос по HTML №1', test_id: test4.id)
question8 = Question.create(body: 'Вопрос по HTML №2', test_id: test4.id)
question9 = Question.create(body: 'Вопрос по Python №1', test_id: test5.id)
question10 = Question.create(body: 'Вопрос по Python №2', test_id: test5.id)

Answer.create(body: 'short tags - это короткий синтаксис позволяющий использовать <? и тем самым сократить запись', question_id: question1.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question1.id, correct: false)

Answer.create(body: 'Изолирование кода необходимо для использования смешанного содержимого скрипта: php, javascript, css и т.п.', question_id: question2.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question2.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question3.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question3.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question4.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question4.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question5.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question5.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question6.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question6.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question7.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question7.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question8.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question8.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question9.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question9.id, correct: false)

Answer.create(body: 'Правильный ответ', question_id: question10.id, correct: true)
Answer.create(body: 'неправильный ответ', question_id: question10.id, correct: false)

TestsUser.create(test_id: test1.id, user_id: user1.id)
TestsUser.create(test_id: test2.id, user_id: user1.id)
TestsUser.create(test_id: test3.id, user_id: user1.id)
TestsUser.create(test_id: test4.id, user_id: user2.id)
TestsUser.create(test_id: test5.id, user_id: user2.id)
TestsUser.create(test_id: test1.id, user_id: user3.id)
