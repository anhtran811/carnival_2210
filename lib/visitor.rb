class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences,
              :tall_enough,
              :total_revenue

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$')
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
end
