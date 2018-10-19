class TicTacToe::Computer < TicTacToe::Player

  attr_reader :level

  EASY = :easy
  HARD = :hard

  def initialize(name, marker, level)
    super(name, marker)
    @level = level
  end

  def choose_spot_on(game_board)
    # sleep 2
    case level
    when EASY
      easy_move(game_board)
    when HARD
      hard_move(game_board)
    end
  end

  private

  def get_best_move(game_board)
    game_board.available_spaces.each do |spot|
      return spot if can_win?(game_board, spot) || can_block?(game_board, spot)
    end
    game_board.random_available_space
  end

  def can_block?(game_board, spot)
    opponent_marker = game_board.get_opposite_marker(marker)
    game_board.winning_move?(spot,opponent_marker)
  end

  def can_win?(game_board, spot)
    game_board.winning_move?(spot, marker)
  end

  def easy_move(game_board)
    random_space = game_board.random_available_space
    game_board.add_marker_at(random_space, marker)
  end

  def hard_move(game_board)
    if game_board.center_is_available?
      game_board.choose_center(marker)
    else
      spot = get_best_move(game_board)
      game_board.add_marker_at(spot, marker)
    end
  end
end
