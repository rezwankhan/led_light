class AuditController < ApplicationController
  def show
    
  end
  def create
    @site_name = params[:name]
    @city_name = (City.find(params[:city])).city
    @no_lights = 9637+ 0.050743818 * (City.find(params[:city])).population
    @light_chosen = (Legacylight.find(params[:light]))


  end

end
