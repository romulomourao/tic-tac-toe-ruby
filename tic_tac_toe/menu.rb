
class TicTacToe::Menu

  ONE_PLAYER = 1
  MULTIPLAYER = 2
  PC = 3
  EASY = 1
  HARD = 2
  SIZES = [3,4,5]

  def init
    select_game_mode
  end

  private

  def select_game_mode
    begin
      Output.greeting
      Output.show_modes
      mode = gets.chomp.to_i
      case mode
      when ONE_PLAYER
        player_one = TicTacToe::Human.new('Player 1', 'X')
        player_two = TicTacToe::Computer.new('Computer', 'O', select_level)
      when MULTIPLAYER
        player_one = TicTacToe::Human.new('Player 1', 'X')
        player_two = TicTacToe::Human.new('Player 2', 'O')
      when PC
        level = select_level
        player_one = TicTacToe::Computer.new('Computer 1', TicTacToe::Board::X_MARKER, level)
        player_two= TicTacToe::Computer.new('Computer 2', TicTacToe::Board::O_MARKER, level)
      else
        raise Output.invalid_entry
      end
    rescue
      retry
    end

    TicTacToe::Game.new(player_one, player_two, select_board_size).start_game

  end

  def select_level
    begin
      Output.show_levels
      case gets.chomp.to_i
      when EASY
        :easy
      when HARD
        :hard
      else
        raise Output.invalid_entry
      end
    rescue
      retry
    end
  end

  def select_board_size
    begin
      Output.show_board_sizes(SIZES)
      size = gets.chomp.to_i
      if SIZES.include?(size)
        size
      else
        raise Output.invalid_entry
      end
    rescue
      retry
    end
  end


end
