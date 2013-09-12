class Move
  MOVES = %w(rock paper scissors)

  attr_reader :move, :player

  def initialize(m)
    @move = m
  end

  def valid?
    MOVES.include?(move)
  end

  def set_player(player)
    @player = player
  end

  def beaten_by(m)
    if rock?
      m.paper?
    elsif scissors?
      m.rock?
    elsif paper?
      m.scissors?
    end
  end

  MOVES.each do |m|
    define_method("#{m}?") do
      m == move
    end
  end

  def to_s
    inspect
  end

  def inspect
    move
  end
end