require 'battle'
require 'kudomon'

describe Battle do
  let(:kudomon_1) { Kudomon.new("kudomon_1", :water, nil, 10, 2) }
  let(:kudomon_2) { Kudomon.new("kudomon_2", :water, nil, 25, 5) }
  let(:kudomon_3) { Kudomon.new("kudomon_3", :fire, nil, 10, 2) }

  let(:battle_1) { Battle.new(kudomon_1, kudomon_2) }
  let(:battle_2) { Battle.new(kudomon_1, kudomon_3) }

  describe "#run" do
    it "returns the winning Kudomon when neither is super effective" do
      expect(battle_1.run).to be(kudomon_2)
    end


    it "returns the winning Kudomon when one is super effective" do
      expect(battle_2.run).to be(kudomon_1)
    end
  end
end
