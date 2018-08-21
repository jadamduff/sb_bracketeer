class SbBracketeer::Team
  attr_accessor :name, :score, :roster
  def initialize(name, score, game = nil)
    @name = name
    @score = score
    @game = game
  end
end
