class SbBracketeer::Bracket
  attr_accessor :year, :wildcard_round, :divisional_round, :conference_championship, :super_bowl

  def initialize(year)
    @year = year
    @wildcard_round = SbBracketeer::Round.create_by_year_and_type(self.year, "wildcard_round", self)
    @divisional_round = SbBracketeer::Round.create_by_year_and_type(self.year, "divisional_round", self)
    @conference_championship = SbBracketeer::Round.create_by_year_and_type(self.year, "conference_championship", self)
    @super_bowl = SbBracketeer::Round.create_by_year_and_type(self.year, "super_bowl", self)
  end

  def display
    puts ""
    puts self.wildcard_round
  end

end
