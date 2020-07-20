class BadgesController < ApplicationController
  before_action :authenticate_user!

  before_action :find_user, only: %i[index]
  before_action :find_badges, only: %i[index]

  def index; end

  private

  def find_user
    @user = current_user
  end

  def find_badges
    @badges = Badge.all
  end

end