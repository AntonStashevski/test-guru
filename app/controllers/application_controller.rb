# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method %i[current_user logged_in?]

  private

  def authenticate_user!
    unless current_user
      session[:path] = request.env['PATH_INFO']
      redirect_to login_path, alert: 'Подтвердите ваш email и password'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
