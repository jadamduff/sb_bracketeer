class SbBracketeer::Round
  attr_accessor :type, :num_games, :game1, :game2, :game3, :game4
  def initialize(type)
    @type = type
  end

  def self.create_by_year_and_type(year, type)
    round = self.new(type)
    case round.type
    when "wildcard_round"
      round.num_games = 4
    when "divisional_round"
      round.num_games = 4
    when "conference_championship"
      round.num_games = 2
    when "super_bowl"
      round.num_games = 1
    end
    round
  end


end
