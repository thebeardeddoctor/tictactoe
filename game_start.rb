require_relative "message.rb"
require_relative "player.rb"
require_relative "board.rb"


class StartGame
 include Messages
 attr_reader :board
 attr_accessor :first, :second, :current_player
 def initialize
  @board = Board.new
  @first = nil
  @second =nil
  @current_player = nil
 end

 def startup
  welcome_msg
  response=gets.chomp.downcase
  check_response(response)
 end

 def check_response(response)
  if response == "y" 
  @first = create_player
  @second = create_player
  create_board
  play
  else
   quit_game_msg
  end
 end

 def create_player
  print get_name_msg
  player_name = gets.chomp
  print get_symbol_msg
  player_symbol = gets.chomp
  Player.new(player_name,player_symbol)
 end

 def create_board
  board.display_board
 end

 def play
  @current_player=first
  get_turn
 end

 def get_turn
  puts " #{@current_player.player_name} select an occupied space numbered 1-9"
  selection = gets.chomp.to_i
  until selection.between?(1,9)
   puts "invalid selection #{@current_player.player_name} select an occupied space numbered 1-9"
  selection = gets.chomp.to_i
 end
  turn(selection)
 end

 def turn(number)
  board.change_board(number, @current_player.player_symbol)
  board.display_board
  verify
 end

 def switch_player
  if @current_player == @first
   @current_player = @second
  else
   @current_player = @first
  end
  @current_player
 end


 def verify
  if board.winner?(@current_player.player_symbol) 
   puts declare_winner 
   new_game?
  elsif board.full? 
   puts declare_draw
   new_game?
  else 
   switch_player
   get_turn
  end
 end

 def declare_winner
  "\n #{@current_player.player_name} you've won!"
 end
 def new_game?
  puts play_again
  response = gets.chomp
  restart(response)
 end
 def restart(response)
  if response == "y"
   board.array = Array.new(9) { |n| n + 1 }
   board.display_board
   play
  else
   quit_game_msg
  end
 end
end


puts StartGame.new.startup