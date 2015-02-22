require 'httparty'

class StudentsController < ApplicationController
  before_action :authenticate_student,
  # :set_student, only: [:show, :edit, :update, :destroy, :survey]
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
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    redirect_to student
  end

  def survey
    student = Student.find_by(params[:id])
    student.update(student_params)
    redirect_to student_path(student)
  end

  # private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :id,
      # :first,
      # :last,
      # :email,
      # :phone,
      # :password_confirmation,
      # :skills,
      # :employment_type,
      # :employment_start_date,
      # :cohort_id
      )
  end


# using API directly
  # def index
  # end

  # def cohorts
  #   @
  # end
end
