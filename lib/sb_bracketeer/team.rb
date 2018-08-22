class SbBracketeer::Team
  attr_accessor :name, :score, :roster, :game
  def initialize(name, score, game)
    @name = name
    @score = score
    @game = game
    self.game.round.bracket.teams << self.name if !self.game.round.bracket.teams.include?(self.name)
  end
end
