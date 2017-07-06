require 'trainer'

describe Trainer do
  subject(:trainer) { Trainer.new("James", [0, 0]) }

  describe "#initialize" do
    it "takes in a name" do
      expect(trainer.name).to eq("James")
    end

    it "takes in a position" do
      expect(trainer.position).to eq([0, 0])
    end

    it "sets an empty array of Kudomon" do
      expect(trainer.kudomon).to be_empty
    end
  end

  describe "#catch" do
    let(:kudomon) { double("kudomon", in_range?: true) }
    
    it "adds Kudomon to collection if in range" do
      expect(kudomon).to receive(:in_range?).with(trainer.position)

      trainer.catch(kudomon)
      expect(trainer.kudomon).to include(kudomon)
    end
  end
end
