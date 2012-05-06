class HomeController < ApplicationController

def index
  # Get all the washers
  @washer = Washer.all
  @washer_brand = ((Washer.all).collect{|a| a.brand}).uniq

end

def brand_name
  @f = CGI.unescape((params[:f]), 'UTF-8')
  @washers_with_brand = Washer.find_all_by_brand(@f)
  render :partial => "brandname", :layout => false, :locals =>  {:brands => @washers_with_brand}
end

end
