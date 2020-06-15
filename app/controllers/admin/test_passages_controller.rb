# frozen_string_literal: true

class Admin::TestPassagesController < Admin::BaseController

  before_action :set_test_passage, only: %i[show update create result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complete?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
