# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update create result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    flash_options = if result.success?
                      current_user.gists.create(question_id: @test_passage.current_question_id, link_to_gist: result.url)
                      { notice: t('.success', url: result.url) }
                    else
                      { alert: t('.fail') }
                    end
    redirect_to @test_passage, flash_options
  end

  def update
    if @test_passage.have_time?
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.complete?
        BadgeService.new(@test_passage).call if @test_passage.passed?

        redirect_to result_test_passage_path(@test_passage)

      else
        render :show
      end
    else
      flash[:timer] = t('.timeout')
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
