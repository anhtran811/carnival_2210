class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences,
              :tall_enough

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$')
    @preferences = []
    @tall_enough = tall_enough
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height)
    @tall_enough
  end
end
