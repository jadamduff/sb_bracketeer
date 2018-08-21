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
    puts "#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}"
    puts "#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}"
    puts ""
    puts ""
    puts "#{self.wildcard_round.game2.team1.name} #{self.wildcard_round.game2.team1.score}"
    puts "#{self.wildcard_round.game2.team2.name} #{self.wildcard_round.game2.team2.score}"
    puts ""
    puts ""
    puts "#{self.wildcard_round.game3.team1.name} #{self.wildcard_round.game3.team1.score}"
    puts "#{self.wildcard_round.game3.team2.name} #{self.wildcard_round.game3.team2.score}"
    puts ""
    puts ""
    puts "#{self.wildcard_round.game4.team1.name} #{self.wildcard_round.game4.team1.score}"
    puts "#{self.wildcard_round.game4.team2.name} #{self.wildcard_round.game4.team2.score}"
    puts ""
  end

end
