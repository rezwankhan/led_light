class NpvcalcController < ApplicationController


  def create
    @state = (City.find(params[:city])).state
    @rate  = (Rate.find_by_state(@state)).commercial

    # Calculate all washer information
    @washer_id = params[:washer_name]
    @washer_selected = Washer.find(@washer_id)

    @washer_vol = @washer_selected.volume
    if(@washer_vol == nil)
      @washer_vol = 3.2
    end

    @washer_ef = @washer_selected.ef
    @washer_kwhyr = @washer_selected.kwhyr
    if(@washer_kwhyr == nil)
      @washer_kwhyr = 346
    end

    query = "select * from washers where kwhyr <" + @washer_kwhyr.to_s() + "
            and volume between 0.9*" + @washer_vol.to_s() + " and 1.1 *" + @washer_vol.to_s() +" order by kwhyr asc limit 10"

    @optimized_washers = Washer.find_by_sql(query)
    @optimized_washer_deltas =   Hash.new

    @optimized_washers.each { |e|
      @optimized_washer_deltas[e.id] = (@washer_kwhyr - e.kwhyr)* @rate
    }
    @optimized_washer_savings = Hash.new
    @optimized_washer_deltas.each { |e|
      npv = -1*Npvcalc::PRICE
      for i in 1..10
        npv += e[1]/(Npvcalc::DISCOUNT_RATE ** i)
      end
      @optimized_washer_savings[e[0]] = npv
    }

    # Calculate all fridge information
    @f_select = Refridgerator.find(params[:name_rfg])

    @f_s_size = @f_select.size
    @f_s_kwhyr = @f_select.kwhyr
    f_query = "select * from refrigerators where kwhyr <" + @f_s_kwhyr.to_s() + "
            and cast(size as float8) between 0.9*" + @f_s_size.to_s() + " and 1.1 *" + @f_s_size.to_s() +" order by kwhyr asc limit 10"

    @opt_fridges = Refridgerator.find_by_sql(f_query) 
    
    # Calculate all dishwasher information
    @dw_select = Dishwasher.find(params[:name_dw])
    @d_s_size = @dw_select.size
    @d_s_kwhyr = @dw_select.kwhyr
    d_query = "select * from dishwashers where kwhyr <" + @d_s_kwhyr.to_s() + "order by kwhyr asc limit 10"

    @opt_dws = Dishwasher.find_by_sql(d_query)

  end
  
end
