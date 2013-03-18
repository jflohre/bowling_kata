#BowlingKata
#
#-dont chase the rabit all the way down the whole
#
#focus on the business aspects and testing
#
#implement a way to keep track of score from the get go
#

class Game

	def initialize
		@score = 0
	end

	def score(line)
		roll = 0 
		while roll < line.length
    
      if last_three_throws_are_strikes(line.length, roll, line[roll], line[roll+1], line[roll+2])
    #  if two_throws_left(line.length, roll) && strike?(line[roll]) &&  strike?(line[roll+1]) && strike?(line[roll+2])
        @score += 30      
        roll+=3 
 #    elsif strike_in_the_last_2_throws(line.length, roll, line[roll], line[roll+1])
                                     
    #  elsif last_throw(line.length, roll) && strike?(line[roll]) 
     #   @score += 0 
      
     # elsif one_throw_left(line.length, roll) && strike?(line[roll])
     #   @score += 0 
      elsif strike_with_one_throw_left(line.length, roll, line[roll], line[roll+1])
        @strike += 10

          
     elsif strike?(line[roll])
        @score += strike_score(line[roll+1], line[roll+2]) 

      elsif one_throw_left(line.length, roll) && frames(line.count(10),line.count(1..9))>=10
        @score-=line[roll+1]


      elsif more_than_one_frame_left_and_spare(line.length, roll, line[roll], line[roll+1])         
		    @score += spare_score(line[roll+2])
			   roll+=1   
      
      else
				@score = @score + line[roll]			
      end

      roll+=1
		end
		@score
	end
#currently getting wrong score because it is adding in te else at the very end to the strikes when they should not be getting added in.
  def last_three_throws_are_strikes(number_of_rolls, roll, current_roll, nextroll1, nextroll2 )
     if (3 == number_of_rolls - roll) && strike?(current_roll) && strike?(nextroll1) && strike?(nextroll2)
      true
    else
      false
    end
  end

def more_than_one_frame_left_and_spare(number_of_rolls, roll, current_roll, nextroll1)
  if (number_of_rolls - roll >1) && spare?(current_roll, nextroll1)
    true
  else
    false
  end
end

def strike_with_one_throw_left(number_of_rolls, roll, current_roll, nextroll1)
  if number_of_rolls - roll ==1 && strike?(current_roll)
    true
  else
    false
  end
end

  def frames(count_of_strikes, count_of_pairs) #checking for bonus round
    frames = count_of_strikes - (count_of_pairs/2)
  end

  def last_throw(number_of_rolls, roll)
    1 == number_of_rolls - roll 
  end

  def one_throw_left(number_of_rolls, roll)
    2 == number_of_rolls - roll 
  end

  def two_throws_left(number_of_rolls, roll)
    3 ==number_of_rolls - roll
  end

  def strike?(roll)
    roll == 10
  end

  def strike_score(nextroll1, nextroll2)
    strike_score = 10 + nextroll1 + nextroll2
  end

  def strike_score_tenth(nextroll1)
    strike_score_tenth = 10 + nextroll1
  end

  def strike_score_eleventh
    strike_score_eleventh = 10 
  end

  def spare?(roll1, roll2)
    roll1 + roll2 == 10
  end
  
  def spare_score(nextroll)
    spare_score = 10 + nextroll
  end
end




