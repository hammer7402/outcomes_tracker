class Admin::CohortsController < ApplicationController
  before_action :authenticate_admin

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def chart
  end

end
