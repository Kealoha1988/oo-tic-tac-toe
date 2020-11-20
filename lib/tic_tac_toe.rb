class TicTacToe

    attr_accessor :board

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [2, 4, 6],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
    ]

        def display_board
            puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
            puts "-----------"
            puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
            puts "-----------"
            puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        end

        def input_to_index(string)
            string.to_i - 1
        end

        def move(thing, piece)
            @board[thing] = piece.upcase
        end

        def position_taken?(thing)
            if @board[thing] == " "
                false
            else 
                true
            end
        end

        def valid_move?(thing)
            if @board[thing] == " " && thing.between?(0, 8)
                true
            else
                false
            end
        end

        def turn_count
            counter = 0
            @board.each do |thing|
                if thing == "X" || thing =="O"
                    counter += 1
                end
            end
            counter
        end

        def current_player
            if turn_count.even?
                "X"
            else
                "O"
            end
        end

        def turn
            puts "Its your move"
            user_input = gets.strip
            boo = current_player
            yay = input_to_index(user_input)
            if valid_move?(yay) == true
                move(yay, boo)
                display_board
            else
                turn
            end
          end

          def won?
            win = nil
            thing = WIN_COMBINATIONS.find do |winning|
                if winning.all?{|i| @board[i] == "X"} || winning.all?{|i| @board[i] == "O"}
                win = winning
            end
        end
        if win != nil
            win
        else
            false
        end
    end

    def full?
       if  @board.any?(" ")
        false
    else
        true
    end
end

def draw?
    if won? == false && full? == true
        true
    else
        false
    end
end

def over?
    draw? || won? 
end

def winner
    if won?
        if turn_count.odd?
            "X"
        else
            "O"
        end
    else nil
    end
end

def play
    while over? == false
        turn
    end
        if won?
    puts "Congratulations #{winner}!"
        else
    puts "Cat's Game!"
    end
end



            


end