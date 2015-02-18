class LoginController < ApplicationController
  def login
  end

  def select
    admin = Admin.find_by({user_name: params[:user_name]})
    student = Student.find_by({user_name: params[:user_name]})
    # binding.pry

    if admin && admin.authenticate(params[:password])
      # store their id in session
      session[:admin_id] = admin.id
      redirect_to admins_path
    elsif student && student.authenticate(params[:password])
      # binding.pry
      # store their id in session
      session[:student_id] = student.id
      redirect_to "/students/#{student.id}"
      # redirect_to student_path(student)
    else
      # rerender the form
      redirect_to login_path
    end
  end
end
