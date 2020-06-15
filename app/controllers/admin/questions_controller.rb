# frozen_string_literal: true

class QuestionsController < Admin::BaseController

  skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[show index new create edit update]
  before_action :find_question, only: %i[destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def new
    @question = @test.questions.new
  end

  def show # Просмотра конкретного вопроса теста
    @question = @test.questions.find(params[:id])
  end

  def create # Создание вопроса
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path
    else
      render :edit
    end
  end

  def edit; end

  def destroy # Удаление вопроса
    @question.destroy
    redirect_to test_questions_path
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
