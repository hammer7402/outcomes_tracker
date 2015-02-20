require 'httparty'

class StudentsController < ApplicationController
  before_action :authenticate_student
  # with using ActiveRecord
  def index
    @students = Student.all
  end

  def show
    # @student = Student.find(params[:user_name])
    @student = Student.find(params[:id])
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
    student = Student.find(params[:id])
    student.edit(student_params)
    redirect_to student
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    redirect_to student
  end

  def survey
    @student = Student.find_by(params[:id])
    # student.update(student_params)
    # redirect_to student
  end

  def student_params
    params.require(:student).permit(
      :first,
      :last,
      :password, :password_confirmation,
      :id,
      :is_employed,
      :employment_start_date,
      :skills,
      :employment_type,
      :cohort_id,
      :phone,
      :email
      )
  end


# using API directly
  # def index
  # end

  # def cohorts
  #   @
  # end
end
