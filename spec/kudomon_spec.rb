require "Kudomon"

describe Kudomon do
  subject(:kudomon) { Kudomon.new("Sourbulb", :grass, [0, 0]) }

  describe "#initialize" do
    it "takes in a species" do
      expect(kudomon.species).to eq("Sourbulb")
    end

    it "takes in a type" do
      expect(kudomon.type).to eq(:grass)
    end

    it "takes in a position" do
      expect(kudomon.position).to eq([0, 0])
    end
    
    it "throws an error if type is invalid" do
      expect { Kudomon.new("Sourbulb", :flying, [0, 0]) }.to raise_error("Invalid type")
    end
  end
end
