class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :boarded

  def initialize(ride)
    @name = ride[:name]
    @min_height = ride[:min_height]
    @admission_fee = ride[:admission_fee]
    @excitement = ride[:excitement]
    @total_revenue = 0
    @boarded = []
  end

  def board_rider(visitor)
    @boarded << visitor
    @boarded.uniq
  end

  def rider_log

  end
end
