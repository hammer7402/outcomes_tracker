require 'httparty'

class StudentsController < ApplicationController

  # with using ActiveRecord
  def index
    @students = Student.all
  end

  def show
    # @student = Student.find(params[:user_name])
    @student = Student.find_by(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)
    student.save
    redirect_to students_path
  end

  def destroy
    Student.destroy(params[:id])
    redirect_to students_path
  end

  def edit
    # @student = Student.find(params[:user_name])
    @student = Student.find_by(params[:id])
  end

  def update
    student = Student.find_by(params[:id])
    student.update(student_params)
    redirect_to student
  end

  def student_params
    params.require(:student).permit(:user_name, :password, :id)
  end

# using API directly
  # def index
  # end
end
