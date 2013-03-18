require "spec_helper"

describe 'Bowling' do 
	let(:game){ game = Game.new}
	it 'should return a new game' do
		game.should be_an_instance_of Game
	end
  
  it 'should return a strike + the next 2 rolls' do
    game.strike_score(4,4).should == 18
  end
  
  it 'should return true if the roll is a strike' do
    game.strike?(10).should == true
  end
  
  it 'should return false if the rolls is not a strike' do 
    game.strike?(9).should == false
  end
	
  it 'should return a score of 3 with a line of [1,1,1]' do
		game.score([1,1,1]).should == 3
	end
	
  it 'should return a score of 24 with a line of [10,5,1,1,1]' do
		game.score([10,5,1,1,1]).should == 24
	end
  
  it 'should return true if roll1 + roll2 = 10' do
    game.spare?(4,6). should == true
  end
  
  it 'should return a score with a spare' do
    game.spare_score(5).should == 15
  end
	
  it 'should return a score of 16 with a line of[5,5,2,2]' do
		game.score([5,5,2,2]).should == 16
	end	
  
  it 'should return a score of 245 with a line of nine 10s and two 1s' do 
    game.score([10,10,10,10,10,10,10,10,10,1,1]).should == 245
  end
  it 'should return a score of 300 with a line of twelve 10s' do 
    game.score([10,10,10,10,10,10,10,10,10,10,1, 1]).should == 273
  end 
    it 'should return a score of 300 with a line of twelve 10s' do 
    game.score([10,10,10,10,10,10,10,10,10,10,9, 1]).should == 289
  end 
    it 'should return a score of 300 with a line of twelve 10s' do 
    game.score([10,10,10,10,10,10,10,10,10,10,1, 1]).should == 273
  end  
  it 'should return a score of 300 with a line of twelve 10s' do 
    game.score([10,10,10,10,10,10,10,10,10,10,10,10]).should == 300
  end
  it 'should return a score of 300 with a line of twelve 10s' do 
    game.score([10,10,10,10,10,10,10,10,10,10,10, 1]).should == 291
  end
  it 'should return a score of 300 with a line of twelve 10s' do 
    game.score([10,10,10,10,10,10,10,10, 9,1,10,9, 0]).should == 268
  end
  it 'should figure out if there is 1 throw left' do
    game.one_throw_left(2,0).should == true
  end
  it 'should figure out if it is on the last throw' do
    game.last_throw(2,1).should == true
  end 
end


