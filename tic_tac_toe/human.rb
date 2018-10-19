class TicTacToe::Human < TicTacToe::Player
  def choose_spot_on(game_board)
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if game_board.valid?(spot)
        game_board.board[spot] = marker
      else
        spot = nil
        Output.invalid_spot(name)
      end
    end
  end
end
