class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    find_test
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end