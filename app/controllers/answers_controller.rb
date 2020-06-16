class AnswersController < ApplicationController
  before_action :authenticate_user!

  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[index]
  before_action :find_answers, only: %i[index]

  def index; end

  private

  def find_answers
    @answers = @question.answers
  end

  def find_question
    @question = @test.questions.find(params[:question_id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

end
