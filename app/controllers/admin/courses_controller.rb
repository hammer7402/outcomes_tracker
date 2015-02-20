class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

end
