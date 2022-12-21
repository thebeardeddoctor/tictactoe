require_relative "message.rb"
class Player
 include Messages
 @@number = 0
#store the players and symbols for each player
 attr_reader :player_name, :player_symbol
 attr_accessor :number
 def initialize(player_name, player_symbol)
  @player_name = player_name
  @player_symbol = player_symbol
  @number = @@number
  @@number += 1
  puts instantiate
 end
 def player_num
  @@number
 end
end

