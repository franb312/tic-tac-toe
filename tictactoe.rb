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
    marker = player_number == 1 ? 'O' : 'X'
    puts "Player #{player_number}, choose a number: "
    chosen_number = gets.chomp.to_i
    @board[chosen_number] = marker
  end

def winner?
    winning_combinations = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # Rows
      [1, 4, 7], [2, 5, 8], [3, 6, 9], # Columns
      [1, 5, 9], [3, 5, 7]              # Diagonals
    ]

    winning_combinations.each do |combo|
      markers = combo.map { |position| @board[position] }
      return true if markers.uniq.length == 1 && markers[0] != nil
    end

    false
  end


  def play
   winner = nil
    2.times do
      [1, 2].each do |player_number|
        picker(player_number)
        print_board
        winner = player_number if winner?
        break if winner
      end
      break if winner
    end
    if winner
      puts "Player #{winner} wins!"
    else
      puts "It's a draw!"
    end
  end
end
game = Game.new
game.picker(1)
game.print_board
game.picker(2)
game.print_board
game.play
