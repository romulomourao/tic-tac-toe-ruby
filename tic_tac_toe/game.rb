

class TicTacToe::Game

  attr_accessor :current_player
  
  def initialize(player_one, player_two, board_width)
    @game_board = TicTacToe::Board.new(board_width)
    @p1 = player_one 
    @p2 = player_two 
    @current_player = sort_first_player
  end

  def start_game
    greeting
    show_board  
    until game_is_over? || tie?
      Output.player_turn(@current_player.name)
      @current_player.choose_spot_on(@game_board)
      @current_player = next_player
      show_board
    end
    game_over_output
  end

  private

  def sort_first_player
    [@p1, @p2].sample
  end

  def next_player
    @current_player.equal?(@p1) ? @p2 : @p1
  end

  def show_board
    Output.show_board(@game_board.board)
  end

  def center_is_available?
    @game_board.center_is_available?
  end

  def choose_center
    @game_board.choose_center(@current_player.marker)
  end

  def game_is_over?
    @game_board.game_is_over?
  end

  def tie?
    @game_board.tie?
  end

  def game_over_output
    return Output.game_over(next_player.name) if game_is_over?
    return Output.tie if tie?
  end

  def greeting
    Output.greeting
    Output.show_player_marker(@p1.name, @p1.marker)
    Output.show_player_marker(@p2.name, @p2.marker)
  end

end

