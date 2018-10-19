class TicTacToe::Board

  X_MARKER = 'X'
  O_MARKER = 'O'
  CENTER = 4

  attr_accessor :board, :size

  def initialize(size)
    @size = size
    @board = ('0'..((@size*@size) -1).to_s).to_a
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
    horizontal_win? || vertical_win? || diagonal_a_win? || diagonal_b_win?
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
    size.times do |index|
      line = []
      index_line = index * size
      size.times do |i|
        line << board[i+index_line]
      end

      return true if line.uniq.length == 1
    end
    false
  end

  def vertical_win?
    size.times do |index|
      line = []
      size.times do |i|
        line << board[(i * size) + index]
      end
      return true if line.uniq.length == 1
    end
    false
  end

  def diagonal_a_win?
    line = []
    size.times do |i|
      line << board[i + (i * size)]
    end
    return true if line.uniq.length == 1
    false
  end

  def diagonal_b_win?
    line = []
    size.times do |i|
      line << board[((i+1) * size) - (i+1)]
    end
    return true if line.uniq.length == 1
    false
  end
end
