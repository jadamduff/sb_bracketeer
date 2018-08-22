class SbBracketeer::Game
  attr_accessor :round, :date, :name, :team1, :team2, :winner
  def self.create_by_round_data(round, data)
    game = self.new
    game.round = round
    game.date = data[:date]
    game.name = data[:name]
    game.team1 = SbBracketeer::Team.new(data[:team1], data[:team1_score], game)
    game.team2 = SbBracketeer::Team.new(data[:team2], data[:team2_score], game)
    if game.team1.score.to_i > game.team2.score.to_i
      game.winner = game.team1
    else
      game.winner = game.team2
    end
    game
  end
end
