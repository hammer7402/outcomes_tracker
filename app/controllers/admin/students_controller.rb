class Admin::StudentsController < ApplicationController
  before_action :authenticate_admin

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

end
