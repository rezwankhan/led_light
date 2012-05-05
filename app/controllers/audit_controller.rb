class AuditController < ApplicationController
  def show
    
  end
  def create
    @site_name = params[:name]
    @city_name = (City.find(params[:city])).city
    @no_lights = (9637+ 0.050743818 * (City.find(params[:city])).population).ceil
    @light_chosen = (Legacylight.find(params[:light]))

    @rate = Rate.find_by_state((City.find(params[:city])).state)
    @var_cost = ((@light_chosen.watt * @no_lights)*0.001*365*Recengine::TIME * @rate.commercial).ceil
    @upfront_inv = (@light_chosen.retailcost * @no_lights).ceil

    @led = Newlight.find(1)
    
    @led_upfront_inv = ((@led.retailcost) * @no_lights)
    @led_var_cost = ((@led.watt * @no_lights)*0.001*365*Recengine::TIME * @rate.commercial).ceil

    # Replacement Costs over 30 years
    # Assuming no failure over the lifespan
    @replacement_cost  = (@led.life/@light_chosen.life)*@upfront_inv
    @led_replacement_cost = 0


  end

end
