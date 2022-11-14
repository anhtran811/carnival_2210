require './lib/visitor'

RSpec.describe Visitor do
  let!(:visitor1) {Visitor.new('Bruce', 54, '$10')}

  it 'exists' do
    expect(visitor1).to be_a(Visitor)
  end

  it 'has attributes' do
    expect(visitor1.name).to eq('Bruce')
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq('10')
    
  end
end



#  visitor1.add_preference(:gentle)

#  visitor1.add_preference(:water)

#  visitor1.preferences
#=> [:gentle, :water]

#  visitor2 = Visitor.new('Tucker', 36, '$5')
#=> #<Visitor:0x000000012f1f30f8 @height=36, @name="Tucker", @preferences=[], @spending_money=5>

#  visitor3 = Visitor.new('Penny', 64, '$15')
#=> #<Visitor:0x000000012f176760 @height=64, @name="Penny", @preferences=[], @spending_money=15>

#  visitor1.tall_enough?(54)
#=> true

#  visitor2.tall_enough?(54)
#=> false

#  visitor3.tall_enough?(54)
#=> true

#  visitor1.tall_enough?(64)
#=> false