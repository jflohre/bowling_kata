require "spec_helper"

describe 'Bowling' do 
	let(:game) {game = Game.new}
	it 'should return a new game' do
		game.should be_an_instance_of Game
	end
	it 'should return 10 if the first frame has an X' do
		game.line([['X'],[0,0]]).should == 10
	end
	it 'should return 10 if the first frame has a /' do
		game.line([[5,'/'],[0,0]]).should == 10
	end
	it 'should return  1 if line is 1,0' do
		game.line([[1,4]]).should == 5
	end
	it 'should return a score of 1 for a roll of 1 and 0' do
		game.adding_frame([1,0]).should ==1
	end
	it 'should return a score of 2 for two rolls of 1' do
		game.adding_frame([1,1]).should ==2
	end
	it 'should return 14 for a strike and two 1s' do
		game.line([['X'], [1,1]]).should == 14
	end
	it 'should return 35 for two strikes and two 1s' do
		game.line([['X'], ['X'], [1,1],[1,1]]).should ==37
	end
	it 'should return true if frame includes X' do
		game.strike?(['X']).should == true
		game.strike?([1,1]).should == false
	end
	it 'should return 60 for three strikes and 2 gutters' do
		game.line([['X'], ['X'], ['X'],[0,0]]).should ==60
	end
	it 'should return 63 for 2 strikes, 5 / and 4 0' do
		game.line([['X'],['X'],[5,'/'], [4,0]]).should == 63
	end
	it 'should return 63 for 2 strikes, 5 / and 4 0' do
		game.line([['X'],['X'],[5,'/'], ['X'], [0,0]]).should == 75
	end
		it 'should return 63 for 2 strikes, 5 / and 4 0' do
		game.line([['X'],['X'],[5,'/'], ['X'], [5,'/'], [0,0]]).should == 95
	end
	it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X']]).should == 300
	end
	it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[3,3]]).should == 255
	end
	it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[3,3]]).should == 279
	end
	it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[5,'/'],[2]]).should == 267
	end
		it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[5,'/'],['X']]).should == 275
	end
	it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[4,4]]).should == 260
	end
		it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[4,4],[4,4]]).should == 238
	end
		it 'should return 300 for 12 strikes' do
		game.line([['X'],['X'],['X'],['X'],['X'],['X'],['X'],['X'],[4,4],['X'],['X'],['X']]).should == 260
	end
end

#need to work on SPARES
#strikes with spares?