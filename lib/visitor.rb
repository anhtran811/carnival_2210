class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences,
              :tall_enough

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_threshold)
    if @height >= height_threshold
      return true
    else
      false
    end
  end

  def pay_for_ride(admission)
    @spending_money -= admission
  end
end
