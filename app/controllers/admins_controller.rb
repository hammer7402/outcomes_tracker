require 'httparty'

class AdminsController < ApplicationController

  def admin
    redirect_to admins_search_path
  end

  def search
  end

  def locations
  end

end
