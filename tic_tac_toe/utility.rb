module Utility

  def end_of_row?(current_position, board_width)
    !current_position.zero? && (current_position % board_width).zero?
  end

end
