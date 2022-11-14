require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  let(:carnival) {Carnival.new('Carnival', '1 week')}
  let!(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let!(:ride2) {Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
  let!(:ride3) {Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}
  let!(:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let!(:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let!(:visitor3) {Visitor.new('Penny', 64, '$15')}
  

  it 'exists' do
    expect(carnival).to be_a(Carnival)
  end

  it 'has attributes' do
    expect(carnival.name).to eq('Carnival')
    expect(carnival.duration).to eq('1 week')
    expect(carnival.rides).to eq([])
  end

  it 'can list the rides' do
    carnival.add_ride(ride1)
    carnival.add_ride(ride2)
    carnival.add_ride(ride3)

    expect(carnival.rides).to eq([ride1, ride2, ride3])
  end

  it 'can have a most profitable ride' do
    visitor1.add_preferences(:gentle)
    visitor2.add_preferences(:gentle)
    visitor3.add_preferences(:thrilling)
    carnival.add_ride(ride1)
    carnival.add_ride(ride2)
  

    4.times do ride1.board_rider(visitor1) 
    end
    5.times do ride2.board_rider(visitor2)
    end
    expect(carnival.most_popular).to eq(ride2)
  end

end
