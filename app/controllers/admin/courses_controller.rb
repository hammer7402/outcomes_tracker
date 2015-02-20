class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def chart
    @course = Course.find(params[:id])
    @employed_percent = []
    @unemployed_percent = []

    @employed_percent.push(@course.percent_employed_by_day(30))
    @employed_percent.push(@course.percent_employed_by_day(60))
    @employed_percent.push(@course.percent_employed_by_day(90))

    @unemployed_percent.push(@course.percent_unemployed_by_day(30))
    @unemployed_percent.push(@course.percent_unemployed_by_day(60))
    @unemployed_percent.push(@course.percent_unemployed_by_day(90))
    # binding.pry
  end

end
