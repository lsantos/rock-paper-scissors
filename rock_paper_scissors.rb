#!/usr/bin/env ruby

%w(game player move).each do |f|
  require "#{File.expand_path(f)}"
end

game = Game.new
puts "Player 1, please enter your name"
player1 = Player.new gets.chomp

if !player1.valid?
  puts "Player 1, invalid name, please enter your name"
  player1 = Player.new gets.chomp

  if !player1.valid?
    puts "Player 1 still invalid, aborting the game"
    exit(0)
  end
end

puts "#{player1.name}, please enter move(rock, paper, scissors)"
move1 = Move.new gets.chomp

if !move1.valid?
  puts "Invalid move please reenter(rock, paper, scissors)"
  move1 = Move.new gets.chomp

  if !move1.valid?
    puts "Move still invalid, aborting the game"
    exit(0)
  end
end

move1.set_player player1

game.add_move move1

puts "Player 2, please enter your name"
player2 = Player.new gets.chomp

if !player2.valid?
  puts "Player 2, invalid name, please enter your name"
  player2 = Player.new gets.chomp

  if !player2.valid?
    puts "Player 2 still invalid, aborting the game"
    exit(0)
  end
end

puts "#{player2.name}, please enter move(rock, paper, scissors)"
move2 = Move.new gets.chomp

if !move2.valid?
  puts "Invalid move please reenter(rock, paper, scissors)"
  move2 = Move.new gets.chomp

  if !move2.valid?
    puts "Move still invalid, aborting the game"
    exit(0)
  end
end

move2.set_player player2

game.add_move move2

game.find_winner

if game.tied?
  puts "Game tied, please play again"
else
  puts "The winner was #{game.winner.player}"
end