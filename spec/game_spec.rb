require_relative '../classes/game'

describe Game do
    game = Game.new('Samuel game','2022/10/12', 'asim')
    game1 = Game.new('Brian game','2017/10/12', 'asim')

    it 'Should create a new game' do
        expect(game).to be_an_instance_of Game
    end

end