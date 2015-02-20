class Admin::CohortsController < ApplicationController
  before_action :authenticate_admin

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def chart
    @cohort = Cohort.find(params[:id])
    @employed_percent = []
    @unemployed_percent = []

    @employed_percent.push(@cohort.percent_employed_by_day(30))
    @employed_percent.push(@cohort.percent_employed_by_day(60))
    @employed_percent.push(@cohort.percent_employed_by_day(90))

    @unemployed_percent.push(@cohort.percent_unemployed_by_day(30))
    @unemployed_percent.push(@cohort.percent_unemployed_by_day(60))
    @unemployed_percent.push(@cohort.percent_unemployed_by_day(90))
    # binding.pry
  end

end
