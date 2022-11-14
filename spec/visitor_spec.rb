require './lib/visitor'

RSpec.describe Visitor do
  let!(:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let!(:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let!(:visitor3) {Visitor.new('Penny', 64, '$15')}
  

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

  xit 'can be tall enough' do
    expect(visitor1.tall_enough?(54)).to be(true)

    expect(visitor2.tall_enough?(54)).to be(false)

    expect(visitor3.tall_enough?(54)).to be(true)

    expect(visitor1.tall_enough?(64)).to be(false)
  end
end



#  visitor1.tall_enough?(54)
#=> true

#  visitor2.tall_enough?(54)
#=> false

#  visitor3.tall_enough?(54)
#=> true

#  visitor1.tall_enough?(64)
#=> false