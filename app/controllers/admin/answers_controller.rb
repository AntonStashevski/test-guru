class Admin::AnswersController < Admin::BaseController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[index new create]
  before_action :find_answers, only: %i[index]
  before_action :find_answer, only: %i[edit update destroy]

  def index; end

  def edit; end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to test_question_answers_path(test_id: @answer.question.test, question_id: @answer.question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to test_question_answers_path(test_id: @answer.question.test, question_id: @answer.question)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to test_question_answers_path(test_id: @answer.question.test, question_id: @answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

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
