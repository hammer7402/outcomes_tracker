class Admin::LocationsController < ApplicationController
  before_action :authenticate_admin

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

end
