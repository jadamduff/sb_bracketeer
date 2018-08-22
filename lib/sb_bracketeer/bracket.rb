class SbBracketeer::Bracket
  attr_accessor :year, :wildcard_round, :divisional_round, :conference_championship, :super_bowl, :teams

  def initialize(year)
    @year = year
    @teams = []
    @wildcard_round = SbBracketeer::Round.create_by_year_and_type(self.year, "wildcard_round", self)
    @divisional_round = SbBracketeer::Round.create_by_year_and_type(self.year, "divisional_round", self)
    @conference_championship = SbBracketeer::Round.create_by_year_and_type(self.year, "conference_championship", self)
    @super_bowl = SbBracketeer::Round.create_by_year_and_type(self.year, "super_bowl", self)
  end

  def display_roster(team, year)
    

  end

  def display_bracket
    display_hash = {
      :wc => {
        :game1 => {
          :label => "#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}",
          :team1 => "#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}".split("").fill(" ", "#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}".length, ("#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}".length.to_i - "#{self.wildcard_round.game1.team1.name} #{self.wildcard_round.game1.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}".split("").fill(" ", "#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}".length, ("#{self.wildcard_round.game1.date} #{self.wildcard_round.game1.name}".length.to_i) - ("#{self.wildcard_round.game1.team2.name} #{self.wildcard_round.game1.team2.score}".length.to_i)).join("")
        },
        :game2 => {
          :label => "#{self.wildcard_round.game2.date} #{self.wildcard_round.game2.name}",
          :team1 => "#{self.wildcard_round.game2.team1.name} #{self.wildcard_round.game2.team1.score}".split("").fill(" ", "#{self.wildcard_round.game2.team1.name} #{self.wildcard_round.game2.team1.score}".length, ("#{self.wildcard_round.game2.date} #{self.wildcard_round.game2.name}".length.to_i - "#{self.wildcard_round.game2.team1.name} #{self.wildcard_round.game2.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.wildcard_round.game2.date} #{self.wildcard_round.game2.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.wildcard_round.game2.team2.name} #{self.wildcard_round.game2.team2.score}".split("").fill(" ", "#{self.wildcard_round.game2.team2.name} #{self.wildcard_round.game2.team2.score}".length, ("#{self.wildcard_round.game2.date} #{self.wildcard_round.game2.name}".length.to_i) - ("#{self.wildcard_round.game2.team2.name} #{self.wildcard_round.game2.team2.score}".length.to_i)).join("")
        },
        :game3 => {
          :label => "#{self.wildcard_round.game3.date} #{self.wildcard_round.game3.name}",
          :team1 => "#{self.wildcard_round.game3.team1.name} #{self.wildcard_round.game3.team1.score}".split("").fill(" ", "#{self.wildcard_round.game3.team1.name} #{self.wildcard_round.game3.team1.score}".length, ("#{self.wildcard_round.game3.date} #{self.wildcard_round.game3.name}".length.to_i - "#{self.wildcard_round.game3.team1.name} #{self.wildcard_round.game3.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.wildcard_round.game3.date} #{self.wildcard_round.game3.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.wildcard_round.game3.team2.name} #{self.wildcard_round.game3.team2.score}".split("").fill(" ", "#{self.wildcard_round.game3.team2.name} #{self.wildcard_round.game3.team2.score}".length, ("#{self.wildcard_round.game3.date} #{self.wildcard_round.game3.name}".length.to_i) - ("#{self.wildcard_round.game3.team2.name} #{self.wildcard_round.game3.team2.score}".length.to_i)).join("")
        },
        :game4 => {
          :label => "#{self.wildcard_round.game4.date} #{self.wildcard_round.game4.name}",
          :team1 => "#{self.wildcard_round.game4.team1.name} #{self.wildcard_round.game4.team1.score}".split("").fill(" ", "#{self.wildcard_round.game4.team1.name} #{self.wildcard_round.game4.team1.score}".length, ("#{self.wildcard_round.game4.date} #{self.wildcard_round.game4.name}".length.to_i - "#{self.wildcard_round.game4.team1.name} #{self.wildcard_round.game4.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.wildcard_round.game4.date} #{self.wildcard_round.game4.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.wildcard_round.game4.team2.name} #{self.wildcard_round.game4.team2.score}".split("").fill(" ", "#{self.wildcard_round.game4.team2.name} #{self.wildcard_round.game4.team2.score}".length, ("#{self.wildcard_round.game4.date} #{self.wildcard_round.game4.name}".length.to_i) - ("#{self.wildcard_round.game4.team2.name} #{self.wildcard_round.game4.team2.score}".length.to_i)).join("")
        }
      },
      :div => {
        :game1 => {
          :label => "#{self.divisional_round.game1.date} #{self.divisional_round.game1.name}",
          :team1 => "#{self.divisional_round.game1.team1.name} #{self.divisional_round.game1.team1.score}".split("").fill(" ", "#{self.divisional_round.game1.team1.name} #{self.divisional_round.game1.team1.score}".length, ("#{self.divisional_round.game1.date} #{self.divisional_round.game1.name}".length.to_i - "#{self.divisional_round.game1.team1.name} #{self.divisional_round.game1.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.divisional_round.game1.date} #{self.divisional_round.game1.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.divisional_round.game1.team2.name} #{self.divisional_round.game1.team2.score}".split("").fill(" ", "#{self.divisional_round.game1.team2.name} #{self.divisional_round.game1.team2.score}".length, ("#{self.divisional_round.game1.date} #{self.divisional_round.game1.name}".length.to_i) - ("#{self.divisional_round.game1.team2.name} #{self.divisional_round.game1.team2.score}".length.to_i)).join("")
        },
        :game2 => {
          :label => "#{self.divisional_round.game2.date} #{self.divisional_round.game2.name}",
          :team1 => "#{self.divisional_round.game2.team1.name} #{self.divisional_round.game2.team1.score}".split("").fill(" ", "#{self.divisional_round.game2.team1.name} #{self.divisional_round.game2.team1.score}".length, ("#{self.divisional_round.game2.date} #{self.divisional_round.game2.name}".length.to_i - "#{self.divisional_round.game2.team1.name} #{self.divisional_round.game2.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.divisional_round.game2.date} #{self.divisional_round.game2.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.divisional_round.game2.team2.name} #{self.divisional_round.game2.team2.score}".split("").fill(" ", "#{self.divisional_round.game2.team2.name} #{self.divisional_round.game2.team2.score}".length, ("#{self.divisional_round.game2.date} #{self.divisional_round.game2.name}".length.to_i) - ("#{self.divisional_round.game2.team2.name} #{self.divisional_round.game2.team2.score}".length.to_i)).join("")
        },
        :game3 => {
          :label => "#{self.divisional_round.game3.date} #{self.divisional_round.game3.name}",
          :team1 => "#{self.divisional_round.game3.team1.name} #{self.divisional_round.game3.team1.score}".split("").fill(" ", "#{self.divisional_round.game3.team1.name} #{self.divisional_round.game3.team1.score}".length, ("#{self.divisional_round.game3.date} #{self.divisional_round.game3.name}".length.to_i - "#{self.divisional_round.game3.team1.name} #{self.divisional_round.game3.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.divisional_round.game3.date} #{self.divisional_round.game3.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.divisional_round.game3.team2.name} #{self.divisional_round.game3.team2.score}".split("").fill(" ", "#{self.divisional_round.game3.team2.name} #{self.divisional_round.game3.team2.score}".length, ("#{self.divisional_round.game3.date} #{self.divisional_round.game3.name}".length.to_i) - ("#{self.divisional_round.game3.team2.name} #{self.divisional_round.game3.team2.score}".length.to_i)).join("")
        },
        :game4 => {
          :label => "#{self.divisional_round.game4.date} #{self.divisional_round.game4.name}",
          :team1 => "#{self.divisional_round.game4.team1.name} #{self.divisional_round.game4.team1.score}".split("").fill(" ", "#{self.divisional_round.game4.team1.name} #{self.divisional_round.game4.team1.score}".length, ("#{self.divisional_round.game4.date} #{self.divisional_round.game4.name}".length.to_i - "#{self.divisional_round.game4.team1.name} #{self.divisional_round.game4.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.divisional_round.game4.date} #{self.divisional_round.game4.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.divisional_round.game4.team2.name} #{self.divisional_round.game4.team2.score}".split("").fill(" ", "#{self.divisional_round.game4.team2.name} #{self.divisional_round.game4.team2.score}".length, ("#{self.divisional_round.game4.date} #{self.divisional_round.game4.name}".length.to_i) - ("#{self.divisional_round.game4.team2.name} #{self.divisional_round.game4.team2.score}".length.to_i)).join("")
        }
      },
      :conf => {
        :game1 => {
          :label => "#{self.conference_championship.game1.date} #{self.conference_championship.game1.name}",
          :team1 => "#{self.conference_championship.game1.team1.name} #{self.conference_championship.game1.team1.score}".split("").fill(" ", "#{self.conference_championship.game1.team1.name} #{self.conference_championship.game1.team1.score}".length, ("#{self.conference_championship.game1.date} #{self.conference_championship.game1.name}".length.to_i - "#{self.conference_championship.game1.team1.name} #{self.conference_championship.game1.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.conference_championship.game1.date} #{self.conference_championship.game1.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.conference_championship.game1.team2.name} #{self.conference_championship.game1.team2.score}".split("").fill(" ", "#{self.conference_championship.game1.team2.name} #{self.conference_championship.game1.team2.score}".length, ("#{self.conference_championship.game1.date} #{self.conference_championship.game1.name}".length.to_i) - ("#{self.conference_championship.game1.team2.name} #{self.conference_championship.game1.team2.score}".length.to_i)).join("")
        },
        :game2 => {
          :label => "#{self.conference_championship.game2.date} #{self.conference_championship.game2.name}",
          :team1 => "#{self.conference_championship.game2.team1.name} #{self.conference_championship.game2.team1.score}".split("").fill(" ", "#{self.conference_championship.game2.team1.name} #{self.conference_championship.game2.team1.score}".length, ("#{self.conference_championship.game2.date} #{self.conference_championship.game2.name}".length.to_i - "#{self.conference_championship.game2.team1.name} #{self.conference_championship.game2.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.conference_championship.game2.date} #{self.conference_championship.game2.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.conference_championship.game2.team2.name} #{self.conference_championship.game2.team2.score}".split("").fill(" ", "#{self.conference_championship.game2.team2.name} #{self.conference_championship.game2.team2.score}".length, ("#{self.conference_championship.game2.date} #{self.conference_championship.game2.name}".length.to_i) - ("#{self.conference_championship.game2.team2.name} #{self.conference_championship.game2.team2.score}".length.to_i)).join("")
        },
      },
      :sb => {
        :game1 => {
          :label => "#{self.super_bowl.game1.date} #{self.super_bowl.game1.name}",
          :team1 => "#{self.super_bowl.game1.team1.name} #{self.super_bowl.game1.team1.score}".split("").fill(" ", "#{self.super_bowl.game1.team1.name} #{self.super_bowl.game1.team1.score}".length, ("#{self.super_bowl.game1.date} #{self.super_bowl.game1.name}".length.to_i - "#{self.super_bowl.game1.team1.name} #{self.super_bowl.game1.team1.score}".length.to_i)).join(""),
          :line_break => "---------------".split("").fill(" ", "---------------".length, ("#{self.super_bowl.game1.date} #{self.super_bowl.game1.name}".length) - "---------------".length).join(''),
          :team2 => "#{self.super_bowl.game1.team2.name} #{self.super_bowl.game1.team2.score}".split("").fill(" ", "#{self.super_bowl.game1.team2.name} #{self.super_bowl.game1.team2.score}".length, ("#{self.super_bowl.game1.date} #{self.super_bowl.game1.name}".length.to_i) - ("#{self.super_bowl.game1.team2.name} #{self.super_bowl.game1.team2.score}".length.to_i)).join("")
        }
      }
    }
    puts ""
    puts "#{display_hash[:wc][:game1][:label]}     #{display_hash[:div][:game1][:label]}"
    puts "#{display_hash[:wc][:game1][:team1]}     #{display_hash[:div][:game1][:team1]}"
    puts "#{display_hash[:wc][:game1][:line_break]}     #{display_hash[:div][:game1][:line_break]}"
    puts "#{display_hash[:wc][:game1][:team2]}     #{display_hash[:div][:game1][:team2]}"
    puts ""
    puts "                                                                                   #{display_hash[:conf][:game1][:label]}"
    puts "                                                                                   #{display_hash[:conf][:game1][:team1]}"
    puts "                                                                                   #{display_hash[:conf][:game1][:line_break]}"
    puts "                                                                                   #{display_hash[:conf][:game1][:team2]}"
    puts ""
    puts "#{display_hash[:wc][:game2][:label]}     #{display_hash[:div][:game2][:label]}"
    puts "#{display_hash[:wc][:game2][:team1]}     #{display_hash[:div][:game2][:team1]}"
    puts "#{display_hash[:wc][:game2][:line_break]}     #{display_hash[:div][:game2][:line_break]}"
    puts "#{display_hash[:wc][:game2][:team2]}     #{display_hash[:div][:game2][:team2]}"
    puts ""
    puts "                                                                                                  #{display_hash[:sb][:game1][:label]}"
    puts "                                                                                                  #{display_hash[:sb][:game1][:team1]}"
    puts "                                                                                                  #{display_hash[:sb][:game1][:line_break]}"
    puts "                                                                                                  #{display_hash[:sb][:game1][:team2]}"
    puts ""
    puts "#{display_hash[:wc][:game3][:label]}     #{display_hash[:div][:game3][:label]}"
    puts "#{display_hash[:wc][:game3][:team1]}     #{display_hash[:div][:game3][:team1]}"
    puts "#{display_hash[:wc][:game3][:line_break]}     #{display_hash[:div][:game3][:line_break]}"
    puts "#{display_hash[:wc][:game3][:team2]}     #{display_hash[:div][:game3][:team2]}"
    puts ""
    puts "                                                                                   #{display_hash[:conf][:game2][:label]}"
    puts "                                                                                   #{display_hash[:conf][:game2][:team1]}"
    puts "                                                                                   #{display_hash[:conf][:game2][:line_break]}"
    puts "                                                                                   #{display_hash[:conf][:game2][:team2]}"
    puts ""
    puts "#{display_hash[:wc][:game4][:label]}     #{display_hash[:div][:game4][:label]}"
    puts "#{display_hash[:wc][:game4][:team1]}     #{display_hash[:div][:game4][:team1]}"
    puts "#{display_hash[:wc][:game4][:line_break]}     #{display_hash[:div][:game4][:line_break]}"
    puts "#{display_hash[:wc][:game4][:team2]}     #{display_hash[:div][:game4][:team2]}"
    puts ""
  end

end
