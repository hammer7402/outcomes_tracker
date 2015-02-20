class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def admin
    @admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def grad_student
    @grad_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

# makes current_user available in our /views
  helper_method(:admin)
  helper_method(:grad_student)

  def authenticate_admin
    redirect_to '/login' unless admin
  end

  def authenticate_student
    redirect_to '/login' unless grad_student
  end
end
