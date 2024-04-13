# frozen_string_literal: true

class Game
  def initialize
    @board = Array.new(10)
  end

  attr_reader :board

  def print_board
    col_separator = '   |   '
    row_separator = '----+-------+----'
    label_for_position = ->(position) { @board[position] || position }

    row_for_display = ->(row) { row.map(&label_for_position).join(col_separator) }
    row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    rows_for_display = row_positions.map(&row_for_display)
    puts rows_for_display.join("\n#{row_separator}\n")
  end

  def picker(player_number)
    player_number == 1 ? 'O' : 'X'
    puts "Player #{player_number}, choose a number: "
    chosen_number = gets.chomp.to_i
    @board[chosen_number] = 0
  end
end
game = Game.new
game.picker(1)
game.print_board
game.picker(2)
game.print_board
