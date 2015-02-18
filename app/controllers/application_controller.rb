class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

# makes current_user available in our /views
  helper_method(:current_student)

  def authenticate
    redirect_to '/login' unless current_student
  end
end
