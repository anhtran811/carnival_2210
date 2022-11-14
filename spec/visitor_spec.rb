require './lib/visitor'
require './lib/ride'

RSpec.describe Visitor do
  let!(:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let!(:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let!(:visitor3) {Visitor.new('Penny', 64, '$15')}
  let!(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}

  it 'exists' do
    expect(visitor1).to be_a(Visitor)
  end

  it 'has attributes' do
    expect(visitor1.name).to eq('Bruce')
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq('10')
  end

  it 'has preferences' do
    visitor1.add_preference(:gentle)
    visitor1.add_preference(:water)

    expect(visitor1.preferences).to eq([:gentle, :water])
  end

  it 'can be tall enough' do
    expect(visitor1.tall_enough?(54)).to be(true)
    expect(visitor2.tall_enough?(54)).to be(false)
    expect(visitor3.tall_enough?(54)).to be(true)
    expect(visitor1.tall_enough?(64)).to be(false)
  end

  it 'can pay for a ride' do
    visitor2.pay_for_ride(1)
    visitor1.pay_for_ride(2)

    expect(visitor1.spending_money).to eq(8)
    expect(visitor2.spending_money).to eq(4)
  end
end
