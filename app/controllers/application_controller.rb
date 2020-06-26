# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def index # перенаправление администраторов на страницу /admin/tests
    case current_user&.class.name
    when 'Admin'
      redirect_to admin_tests_path
    else
      redirect_to tests_path
    end
  end

  def default_url_options
    { lang: I18n.locale }
  end

  def after_sign_in_path_for(resource) # resource это объект класса user
    resource.admin? ? admin_tests_path : tests_path
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
