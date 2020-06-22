# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index # перенаправление администраторов на страницу /admin/tests
    case current_user&.class.name
    when 'Admin'
      redirect_to admin_tests_path
    else
      redirect_to tests_path
    end
  end

  def after_sign_in_path_for(resource) # resource это объект класса user
    resource.admin? ? admin_tests_path : tests_path
  end

end
