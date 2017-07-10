require_relative './board'

class Game

  attr_reader :board

  def initialize(board = Board.default)
    @board = board
  end

  def play
    loop do
      board.render
      prompt_player
    end
  end

  def prompt_player
    puts "Would you like to move or try to catch a Kudomon?"
    puts "Enter 'move' or 'catch'"
    puts "You can view your Kudomon by typing 'view'"
    puts "You can end the game at any time by pressing CTRL+C or typing 'end'"
    response = gets.chomp

    case response
    when "move"
      move_player
    when "catch"
      catch_kudomon
    when "end"
      end_game
    when "view"
      view_kudomon
    else
      puts "Invalid input, try again"
    end

    puts "_" * 100
  end

  def move_player
    puts "Which direction would you like to move? Enter: n, e, s, or w"
    response = gets.chomp
    board.move_trainer(response.to_sym)
  end

  def catch_kudomon
    puts "Which kudomon would you like to catch? Enter: n, e, s, or w"
    response = gets.chomp
    board.catch_kudomon(response.to_sym)
  end

  def view_kudomon
    if board.trainer.kudomon.empty?
      puts "You don't have any Kudomon"
    else
      board.trainer.kudomon.each { |kudomon| kudomon.display }
    end
  end

  def end_game
    exit
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
