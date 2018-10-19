
module TicTacToe
end

lib_path = File.expand_path(File.dirname(__FILE__))
Dir["#{lib_path}/tic_tac_toe/**/*.rb"].each { |file| require file }

TicTacToe::Menu.new.init
