require 'minitest/autorun'

%w(game move).each do |f|
  require "#{File.expand_path(f)}"
end

class TestGame < MiniTest::Unit::TestCase
  attr_reader :game

  def setup
    @game = Game.new
  end

  def test_rock_against_scissors
    game.add_move(Move.new('rock'))
    game.add_move(Move.new('scissors'))
    game.find_winner
    assert(game.winner.rock?)
  end

  def test_scissors_against_paper
    game.add_move(Move.new('scissors'))
    game.add_move(Move.new('paper'))
    game.find_winner
    assert(game.winner.scissors?)
  end

  def test_paper_against_rock
    game.add_move(Move.new('rock'))
    game.add_move(Move.new('paper'))
    game.find_winner
    assert(game.winner.paper?)
  end

  def test_tied
    game.add_move(Move.new('paper'))
    game.add_move(Move.new('paper'))
    game.find_winner
    assert(game.tied?)
  end
end