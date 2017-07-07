require 'board'

describe Board do
  subject(:board) { Board.new(10) }

  describe "#initialize" do
    it "accepts a size" do
      expect(board.size).to eq(10)
    end


    it "creates a square grid of length size" do
      expect(board.grid.length).to eq(10)
      expect(board.grid[0].length).to eq(10)
    end
  end

  describe "::default" do
    subject(:board) { Board.default }

    it "returns a board instance" do
      expect(board).to be_a(Board)
    end

    it "fills one quarter of board with Kudomon" do
      expect(board.kudomon_count).to eq(25)
    end

    it "adds three default trainers" do
      expect(board.trainer_count).to be 3
    end
  end
end
