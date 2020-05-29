# frozen_string_literal: true

class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def new; end

  def show # Просмотра конкретного вопроса теста
    render plain: @test.questions.find(params[:id]).inspect
  end

  def create # Создание вопроса
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_questions_path
    else
      Render plain question.errors.full_messages
    end

  end

  def destroy # Удаление вопроса
    @question.delete
    redirect_to test_questions_path
  end

  def index # Просмотра списка вопросов теста
    render plain: @test.questions.inspect
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
