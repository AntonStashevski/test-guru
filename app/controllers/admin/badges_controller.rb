class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!

  before_action :find_user, only: %i[index]
  before_action :find_badges, only: %i[index]
  before_action :find_badge, only: %i[edit update destroy]

  def index; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule, :description, :value)
  end

  def find_user
    @user = current_user
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_badges
    @badges = Badge.all
  end

end