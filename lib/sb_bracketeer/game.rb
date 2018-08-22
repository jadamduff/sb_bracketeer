# Bracket -> Round -> GAME -> Team

class SbBracketeer::Game
  attr_accessor :round, :date, :name, :team1, :team2, :winner

  # This is the only method that creates new SbBracketeer::Game Objects in the entire program. SbBracketeer::Game.new is never called anywhere else.
  def self.create_by_round_data(round, data)
    game = self.new
    game.round = round # Creates a has_one relationship to the Round.
    game.date = data[:date]
    game.name = data[:name]

    # Assigns team1 and team2 attributes to a new SbBracketeer::Team Object.
    # => Passes data to the new Team Object from the data received from the Round Object.
    game.team1 = SbBracketeer::Team.new(data[:team1], data[:team1_score], game)
    game.team2 = SbBracketeer::Team.new(data[:team2], data[:team2_score], game)

    # The below code evaluates the higher score of the two teams and assigns game.winner as the resulting team.
    if game.team1.score.to_i > game.team2.score.to_i
      game.winner = game.team1
    else
      game.winner = game.team2
    end

    game # Returns the newly made SbBracketeer::Game Object.

  end
end
