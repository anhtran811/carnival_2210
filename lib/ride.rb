class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(ride)
    @name = ride[:name]
    @min_height = ride[:min_height]
    @admission_fee = ride[:admission_fee]
    @excitement = ride[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(visitor)
    if @rider_log[visitor].nil? 
      @rider_log[visitor] = 1 
    else
      @rider_log[visitor] += 1
    end
  end

  def total_revenue
    @total_revenue += @admission_fee
  end

end
