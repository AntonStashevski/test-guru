# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show # Просмотра конкретного вопроса теста
    @question = @test.questions.find(params[:id])
  end

  def index # Просмотра списка вопросов теста
    @questions = @test.questions
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_test_not_found
    render plain: 'Такой вопрос не найден.'
  end
end
