class TicTacToe::Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def choose_spot_on(game_board); end
end
