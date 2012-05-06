class HomeController < ApplicationController

def index
  # Get all the washers
  @washer = Washer.all
  @washer_brand = (((Washer.all).collect{|a| a.brand}).uniq).sort!
  
  #Get all fridges 
  @fridges = Refridgerator.all
  @brand_rfg = (((Refridgerator.all).collect{|a| a.brand}).uniq).sort!

  #Get all dish-washers
  @dws = Dishwasher.all
  @brand_dw = (((Dishwasher.all).collect{|a| a.brand}).uniq).sort!

end

def brand_name
  @f = CGI.unescape((params[:f]), 'UTF-8')
  @washers_with_brand = Washer.find_all_by_brand(@f)
  render :partial => "brandname", :layout => false, :locals =>  {:brands => @washers_with_brand}
end

def fridge_brand_name
  @brand_f = CGI.unescape((params[:brandf]), 'UTF-8')
  @brands_w_f = Refridgerator.find_all_by_brand(@brand_f)
  render :partial => "fridgebrand", :layout => false, :locals =>  {:f_brands_loc => @brands_w_f}
end

def dw_brand_name
  @brand_dw = CGI.unescape((params[:branddw]), 'UTF-8')
  @brands_w_dw = Dishwasher.find_all_by_brand(@brand_dw)
  render :partial => "dwbrands", :layout => false, :locals =>  {:dw_brands_loc => @brands_w_dw}
end



end