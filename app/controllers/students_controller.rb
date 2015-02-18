class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(params[:user_name])
    @student_id = Student.find_by(params[:id])
  end
end
