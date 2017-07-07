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
    it "raises and error if Kudomon is not in range" do
      kudomon = double("kudomon", in_range?: false)
      expect { trainer.catch(kudomon) }.to raise_error("Kudomon not in range")
    end

    it "raises an error if Kudomon is already caught" do
      kudomon = double("kudomon", in_range?: true, status: :being_caught)
      expect { trainer.catch(kudomon) }.to raise_error("Kudomon being caught by another trainer")
    end

    it "raises an error if Kudomon is being caught" do
      kudomon = double("kudomon", in_range?: true, status: :caught)
      expect { trainer.catch(kudomon) }.to raise_error("Kudomon already caught")
    end

    it "adds Kudomon to collection if in range and catchable" do
      kudomon = double("kudomon", in_range?: true, status: :free)
      expect(kudomon).to receive(:in_range?).with(trainer.position)
      expect(kudomon).to receive(:status=).twice

      trainer.catch(kudomon)
      expect(trainer.kudomon).to include(kudomon)
    end
  end
end
