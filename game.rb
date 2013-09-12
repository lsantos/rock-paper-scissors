class Game
  attr_reader :moves
  attr_accessor :winner

  def initialize
    @moves = []
  end

  def add_move(m)
    moves << m if m.valid?
  end

  def find_winner
    if moves.first.beaten_by(moves.last)
      self.winner = moves.last
    elsif moves.last.beaten_by(moves.first)
      self.winner = moves.first
    end
  end

  def tied?
    winner.nil?
  end
end
