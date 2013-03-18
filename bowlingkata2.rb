#BowlingKata
#
#-dont chase the rabit all the way down the whole
#
#focus on the business aspects and testing
#
#implement a way to keep track of score from th e get go
#
	#What if we made a frame 1-10methods to get 
class Game
	def initialize 
		@score =0
	end

	def line(line)	
		frames= 0
		while frames < line.length
			if frames > 9 &&
				@score+=0
				frames +=4

			elsif three_strikes_in_a_row?(line[frames], line[frames+1], line[frames+2])
				@score += 30

			elsif two_strikes_in_a_row?(line[frames], line[frames+1])
			 	@score+= 20 + two_strikes_in_a_row(line[frames+2])			
			
			elsif strike_followed_by_a_spare?(line[frames], line[frames+1])
				@score+= 20 

			elsif spare_followed_by_a_strike?(line[frames], line[frames+1])	
				@score+=20
			
			elsif strike?(line[frames])
				@score += 10 + adding_frame(line[frames+1])
			
			elsif spare?(line[frames])
				@score +=  spare_score(line[frames+1])
			
			else 
				@score += adding_frame(line[frames])	
			end
			frames += 1
		end
		@score
	end


	def spare_followed_by_a_strike?(current_frame, next_frame)
		spare?(current_frame) && strike?(next_frame)
	end

	def strike_followed_by_a_spare?(current_frame, next_frame)
		strike?(current_frame) && spare?(next_frame)
	end
	def three_strikes_in_a_row?(current_frame, next_frame, third_frame)
		strike?(current_frame) && strike?(next_frame) && strike?(third_frame)			
	end

	def two_strikes_in_a_row?(current_frame, next_frame)
		strike?(current_frame) && strike?(next_frame)
	end

	def two_strikes_in_a_row(frame)
		roll1 = frame[0] 
		two_strikes_in_a_row = roll1.to_i
	end

	def  adding_frame(frame)
		roll1 = frame[0] 
		roll2 = frame[1] 
		adding_frame = roll1.to_i + roll2.to_i
	end
	
	def strike?(frame)
		frame.include?('X')
	end
	
	def strike(frame)
		@score +=  10 + adding_frame(frame) 
	end

	def spare?(frame)
		frame.include?('/')
	end
	def spare_score(frame)
		roll1 = frame[0]
		spare = 10 + roll1
	end
end
