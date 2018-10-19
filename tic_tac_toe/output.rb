require 'colorize'
require 'terminal-table'
require_relative 'utility'

class Output
  extend Utility

  class << self
    def greeting
      puts "===| Welcome to TicTacToe |=== \n".white.on_blue
    end

    def show_modes
      puts "1 - Player x PC \n2 - Player x Player \n3 - PC x PC\n".yellow
      print 'Choose Mode:[1-3]  '.yellow
    end

    def show_board_sizes(sizes)
      sizes.length.times do |i|
        size = sizes[i]
        puts "Type #{size} for #{size}x#{size} board".green
      end
    end

    def show_levels
      puts "Select the game level:\n".blue
      puts "1 - EASY\n2 - HARD\n".blue
      print 'Choose Level:[1-2]  '.blue
    end

    def game_over(player_name)
      puts "Congrats, #{player_name}! You won the game :)".green
    end

    def tie
      puts 'It was a tie :('.yellow
    end

    def player_turn(player_name)
      print "It's your turn, #{player_name}: ".yellow
    end

    def invalid_entry
      puts 'This entry is not valid, please try again: '.red
    end

    def invalid_spot(player_name)
      puts "#{player_name}, this spot is already taken, choose another: ".red
    end

    def show_board(board)
      table = Terminal::Table.new do |t|
        board_size = board.size
        board_width = Math.sqrt(board_size)
        board_row = []
        board_size.times do |current_position|
          if end_of_row?(current_position, board_width)
            t << board_row
            board_row = []
          end
          board_row << board[current_position]
        end
        t.add_row board_row
        t.style = { all_separators: true }
      end
      puts "\n#{table}\n".blue
    end

    def show_player_marker(player_name, marker)
      puts "> #{player_name} is playing with ".blue.underline + marker.to_s.yellow
    end

  end
end
