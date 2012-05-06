class NpvcalcController < ApplicationController


  def create
    @state = (City.find(params[:city])).state
    @rate  = (Rate.find_by_state(@state)).commercial

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
    logger.debug query
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

  end
  
end
