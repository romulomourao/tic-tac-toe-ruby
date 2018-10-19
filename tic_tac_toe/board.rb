
require 'pry'
class TicTacToe::Board

  X_MARKER = 'X'
  O_MARKER = 'O'
  CENTER = 4

  attr_accessor :board

  def initialize
    @board =  %w(0 1 2 3 4 5 6 7 8)
  end

  def add_marker_at(spot, marker)
    board[spot.to_i] = marker
  end

  def winning_move?(spot, marker)
    board[spot.to_i] = marker
    result = game_is_over?
    board[spot.to_i] = spot
    result
  end

  def choose_center(marker)
    board[CENTER] = marker
  end

  def random_available_space
    available_spaces.sample
  end

  def get_opposite_marker(marker)
    marker.equal?(X_MARKER)? O_MARKER : X_MARKER
  end

  def available_spaces
    board.select { |space| available?(space) }
  end

  def game_is_over?
    horizontal_win? || vertical_win? || diagonal_win?
  end

  def valid?(spot)
    board[spot.to_i] != X_MARKER && board[spot.to_i] != O_MARKER
  end

  def tie?
    board.all? { |space| !available?(space) }
  end

  def center_is_available?
    board[CENTER] == CENTER.to_s
  end

  private

  def available?(space)
    space != X_MARKER && space != O_MARKER
  end

  def horizontal_win?
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1
  end

  def vertical_win?
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1
  end

  def diagonal_win?
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end
end
