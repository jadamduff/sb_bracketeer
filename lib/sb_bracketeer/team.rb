# Bracket -> Round -> Game -> TEAM

class SbBracketeer::Team
  attr_accessor :name, :score, :roster, :game
  def initialize(name, score, game)
    @name = name
    @score = score
    @game = game # Creates a has_one relationship to the Game.

    # Continues calling parent objects until the Bracket is reached.
    # => Only adds itself to the Bracket's @teams array if the Team's name isn't already included in the array.
    # => This is necessary for the Bracket to be able to check whether user input is a valid team.
    self.game.round.bracket.teams << self.name if !self.game.round.bracket.teams.include?(self.name)
  end
end
