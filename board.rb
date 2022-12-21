class Board
#  #display the board and score
   attr_accessor :array 
   attr_reader :WINNERS
  def initialize
    @array= Array.new(9) { |n| n + 1 }
    @WINNERS = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  end 
  def display_board 
   puts "
   Tic Tac Toe:
    #{array[0]} | #{array[1]} | #{array[2]}
   ---+---+---
    #{array[3]} | #{array[4]} | #{array[5]}
   ---+---+---
    #{array[6]} | #{array[7]} | #{array[8]}
   "
  end
  def change_board(number,symbol)
    array[number-1] = symbol
  end
  def winner?(symbol)
    verify_array = Array.new(3) { symbol }
    @WINNERS.any? do |triplet| 
     [array[triplet[0]],array[triplet[1]],array[triplet[2]]] == verify_array 
     end
  end
  def full?
    array.all? { |cell| cell =~ /[^0-9]/ }
  end
   

   
#   def display_board
#    puts "here is your empty board"
#    puts board
#    puts "Player 1: #{self.player_1}   #{self.player_1_symbol}"
#    puts "Player 2: #{self.player_2}   #{self.player_2_symbol}"
#    game= Gameplay.new(player_1, player_2).random_select_first_player 
#   end
 end
 