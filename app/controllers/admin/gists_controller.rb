# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  before_action :find_gists, only: %i[index]

  def index; end

  def create
    @gist = current_user.gists.new(gist_params)
  end

  private

  def gist_params
    params.require(:gist).permit(:user_id, :question_id, :link_to_gist)
  end

  def find_gists
    @gists = Gist.all
  end
end
