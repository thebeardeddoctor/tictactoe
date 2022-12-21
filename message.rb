module Messages
  def welcome_msg
   print "would you like to play? (y/n)  "
  end
  def get_name_msg
    "\n what is your name? "
  end
  def get_symbol_msg
    "\n what is your symbol? "
  end
  def quit_game_msg
    "Thanks for playing!"
  end
  def instantiate
    "\n#{player_name} is player #{player_num} and will be the '#{player_symbol}' symbol.\n"
  end
 
  def declare_draw
    "We have a draw!"
  end
  def play_again
    "would you like to play again?"
  end
end