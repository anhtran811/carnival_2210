require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  let!(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let!(:ride2) {Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
  let!(:ride3) {Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}
  let!(:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let!(:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let!(:visitor3) {Visitor.new('Penny', 64, '$15')}
  

  it 'exists' do
    expect(ride1).to be_a(Ride)
  end

  it 'has attributes' do
    expect(ride1.name).to eq('Carousel')
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
  end

  it 'starts with no revenue' do
    expect(ride1.total_revenue).to eq(0)
  end

  it 'can have a rider log' do
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)

    expect(ride1.rider_log).to eq({
      visitor1 => 2,
      visitor2 => 1
      })
  end

  it 'can have revenue' do
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)

    expect(ride1.rider_log).to eq({
      visitor1 => 2,
      visitor2 => 1
      })

    visitor2.pay_for_ride(1)
    visitor1.pay_for_ride(2)

    expect(ride1.total_revenue).to eq(3)
  end
end


#  ride1.total_revenue
# #=> 3

#  visitor3 = Visitor.new('Penny', 64, '$15')
# #=> #<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[], @spending_money=15>

#  ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
# #=> #<Ride:0x0000000159a0cd00 @admission_fee=5, @excitement=:gentle, @min_height=36, @name="Ferris Wheel", @rider_log={}>

#  ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
# #=> #<Ride:0x0000000159ae7a68 @admission_fee=2, @excitement=:thrilling, @min_height=54, @name="Roller Coaster", @rider_log={}>

#  visitor2.add_preference(:thrilling)
# #=> [:gentle, :thrilling]

#  visitor3.add_preference(:thrilling)
# #=> [:thrilling]

#  ride3.board_rider(visitor1)

#  ride3.board_rider(visitor2)

#  ride3.board_rider(visitor3)

#  visitor1.spending_money
# #=> 8

#  visitor2.spending_money
# #=> 4

#  visitor3.spending_money
# #=> 13

#  ride3.rider_log
# #=> {#<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[:thrilling], @spending_money=13>=>1}

#  ride3.total_revenue
# #=> 2