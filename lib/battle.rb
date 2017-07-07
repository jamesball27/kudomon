require 'byebug'

class Battle

  SUPER_EFFECTIVE = {
    water: :fire,
    fire: :grass,
    grass: :rock,
    rock: :electric,
    electric: :water
  }

  attr_reader :kudomon
  attr_accessor :winner, :attacker, :defender

  def initialize(kudomon_1, kudomon_2)
    @kudomon = [kudomon_1, kudomon_2].shuffle
    @attacker = @kudomon[0]
    @defender = @kudomon[1]
    @winner = nil
  end

  def run
    until over?
      attack
      set_winner
      swap_kudomon
    end

    winner
  end

  private

  def over?
    attacker.hp <= 0 || defender.hp <= 0
  end

  def attack
    attack_points = attacker.cp
    attack_points *= 2 if super_effective?
    defender.hp -= attack_points
  end

  def super_effective?
    return true if attacker.type == :psychic && defender.type != :psychic
    SUPER_EFFECTIVE[attacker.type] == defender.type
  end

  def set_winner
    self.winner =
      attacker.hp < defender.hp ? defender : attacker
  end

  def swap_kudomon
    kudomon << kudomon.shift
    self.attacker = kudomon[0]
    self.defender = kudomon[1]
  end
end
