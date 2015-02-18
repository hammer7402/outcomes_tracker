require 'httparty'

class AdminsController < ApplicationController

  def admin
    redirect_to admins_search_path
  end

  def search
  end

  def locations
    @locations = Location.all
  end

  def location
    @location = Location.find(params[:id])
  end

end
