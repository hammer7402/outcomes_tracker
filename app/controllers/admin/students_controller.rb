class Admin::StudentsController < ApplicationController
  before_action :authenticate_admin

  def index
    @students = Student.all.sort_by &:last
  end

  def show
    @student = Student.find(params[:id])
  end

end
