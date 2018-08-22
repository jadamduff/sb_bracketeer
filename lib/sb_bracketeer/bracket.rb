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
    display_hash = {
      :wc => {
        :label => "#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}",
        :team1 => "#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}".split("").fill(" ", "#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}".length, ("#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}".length) - ("#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}".length)).join(""),
        :line_break => "---------------".split("").fill(" ", "---------------", ("#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}".length) - "---------------".length),
        :team2 => "#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}".split("").fill(" ", "#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}".length, ("#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}".length) - ("#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}".length)).join(""),
      },
      :div => {

      },
      :conf => {

      },
      :sb => {

      }
    }
    puts ""
    puts "#{display_hash[:wc][:label]}               |"
    puts "#{display_hash[:wc][:team1]}               |"
    puts "#{display_hash[:wc][:line_break]}               |"
    puts "#{display_hash[:wc][:team2]}               |"
    puts ""
    puts "                                                  #{self.divisional_round.game1.date} #{self.divisional_round.game1.name}"
    puts "                                                  #{self.divisional_round.game1.team1.name} #{self.divisional_round.game1.team1.score}"
    puts "                                                  ---------------"
    puts "                                                  #{self.divisional_round.game1.team2.name} #{self.divisional_round.game1.team2.score}"
    puts ""
    puts "#{self.wildcard_round.game2.date} #{self.wildcard_round.game2.name}"
    puts "#{self.wildcard_round.game2.team1.name} #{self.wildcard_round.game2.team1.score}"
    puts "---------------"
    puts "#{self.wildcard_round.game2.team2.name} #{self.wildcard_round.game2.team2.score}"
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "#{self.wildcard_round.game3.date} #{self.wildcard_round.game3.name}"
    puts "#{self.wildcard_round.game3.team1.name} #{self.wildcard_round.game3.team1.score}"
    puts "---------------"
    puts "#{self.wildcard_round.game3.team2.name} #{self.wildcard_round.game3.team2.score}"
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "#{self.wildcard_round.game4.date} #{self.wildcard_round.game4.name}"
    puts "#{self.wildcard_round.game4.team1.name} #{self.wildcard_round.game4.team1.score}"
    puts "---------------"
    puts "#{self.wildcard_round.game4.team2.name} #{self.wildcard_round.game4.team2.score}"
    puts ""
  end

end
