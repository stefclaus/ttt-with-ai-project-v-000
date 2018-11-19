module Players
class Computer < Player

attr_reader :board

  def move(board, game=Game.new)
    corners = ["1", "3", "7", "9"]
    win_combinations = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # First column
      [1,4,7],  # Middle column
      [2,5,8],  # Last column
      [0,4,8],  # diagnoal one
      [2,4,6]  # last diagnal
        ]
      sides = ["2", "4", "6", "8"]
      #step 1

      win_combinations.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]
          if position_1 == "X" && position_2 == "X"
             board.cells[position_3] == "X"
         elsif position_2 == "X" && position_3 == "X"
            board.cells[position_1] == "X"
          elsif position_3 == "X" && position_1 == "X"
            board.cells[position_2] == "X"
          elsif position_1 == "O" && position_2 == "O"
               board.cells[position_3] == "O"
          elsif position_2 == "O" && position_3 == "O"
              board.cells[position_1] == "O"
          elsif position_3 == "O" && position_1 == "O"
              board.cells[position_2] == "O"
          else
       	  end # end if
          end # end each

    #empty corner step 7, should be if any corner is empty
    if board.turn_count == 0
      return corners.sample
    end #ends step 7

#this code doesn't follow a rule :( )
  #  if board.turn_count == 2 && board[5] == "O"
  #      if board[1] == "X"
  #        return 9
  #      elsif board[3] == "X"
  #        return 7
  #      elsif board[7] == "X"
  #        return 3
  #      elsif board[9] == "X"
  #         return 1
  #      end #ends boardifs
  #    end #ends board turn count

#this code doesn't follow one of the rules :( )
  #    if board.turn_count == 2 && !board[5] == "O"
#        return corners.sample
#      end #ends if board.turn_count

#    end

#step 8
  if board.valid_move?.sides
    my_answer =
    return sides.sample
  end #ends step 8

   my_answer = ("1".."9").to_a.sample
     until board.valid_move?(my_answer)
       my_answer = ("1".."9").to_a.sample
    end
   my_answer

  end #ends method


#  Win: If you have two in a row, play the third to get three in a row.

#  Block: If the opponent has two in a row, play the third to block them.

#  Fork: Create an opportunity where you can win in two ways.

#  Block Opponent's Fork:

#  Option 1: Create two in a row to force the opponent into defending, as long
#as it doesn't result in them creating a fork or winning. For example, if "X" has a corner,
#"O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in
#order to win. (Playing a corner in this scenario creates a fork for "X" to win.)

#  Option 2: If there is a configuration where the opponent can fork, block that fork.

#  Center: Play the center.

#  Opposite Corner: If the opponent is in the corner, play the opposite corner.

#  Empty Corner: Play an empty corner. Step 7
#  Empty Side: Play an empty side. Step 8



end #ends class
end #ends module
