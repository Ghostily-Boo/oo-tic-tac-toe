require 'pry'

class TicTacToe

    attr_reader :board

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize
        @board = [" "] * 9
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(num)
        @index = num.to_i - 1
    end

    def move(index, token)
        board[index] = token
    end

    def position_taken?(index)
        board[index] != " "
    end

    def valid_move?(index)
        (0..8).include?(index) && !position_taken?(index)
    end

    def turn
        puts "Please enter 1-9"
        num = gets.strip
        input = input_to_index(num)
        valid_move?(input) ? move(input, current_player) : turn
        display_board
    end

    def turn_count
        (board - [" "]).length
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.each do |a, b, c|
            if board[a] == board[b] && board[b] == board[c] && position_taken?(a)
                return [a, b, c]
            end
        end
        false
    end

    def full?
        turn_count == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
        #why not full? what issues down the line?
    end

    def winner
        won? ? board[won?[1]] : nil
    end

    def play
        turn until over?
        puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
        #why puts here?
    end

end