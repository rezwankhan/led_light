class Npvcalc < ActiveRecord::Base
  
  DISCOUNT_RATE = 1.02
  YEARS = 10

  # to change layer
  PRICE  = 500

  RATIO = 1/(1+DISCOUNT_RATE)
  

end
