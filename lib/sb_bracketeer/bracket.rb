# BRACKET -> Round -> Game -> Team

class SbBracketeer::Bracket
  attr_accessor :year, :wildcard_round, :divisional_round, :conference_championship, :super_bowl, :teams

  def initialize(year)
    @year = year
    @teams = []  # An array of all teams that are included in a bracket. Teams are added by the Team Object.

    # Each bracket round initializes with a new SbBracketeer::Round Object, passing in the year, round type, and the bracket object that the round should belong to (self).
    @wildcard_round = SbBracketeer::Round.create_by_year_and_type(self.year, "wildcard_round", self)
    @divisional_round = SbBracketeer::Round.create_by_year_and_type(self.year, "divisional_round", self)
    @conference_championship = SbBracketeer::Round.create_by_year_and_type(self.year, "conference_championship", self)
    @super_bowl = SbBracketeer::Round.create_by_year_and_type(self.year, "super_bowl", self)
  end

  # display_roster collects the scraped team roster data from Scraper and fills/prints an array of '<player number> <player name>' strings.
  def display_roster(team_name, year)
    roster_arr = SbBracketeer::Roster.create_or_return_roster_by_team_and_year(team_name, year)
    puts ""
    puts year.to_s + ' ' + team_name.to_s.upcase # Puts a roster label Ex. 2008 PITTSBURGH STEELERS.
    roster_arr.each {|row| puts row}
    puts ""
  end

  # valid_team? is used by a CLI Object to confirm that the team name entered by the user matches a team from the playoff bracket.
  def valid_team?(team)
    team_name = team.split(' ').map(&:capitalize).join(' ') # Capitalizes each word in the entered team name to match the format in which team names are added to the bracket's @teams array.
    self.teams.include?(team_name) ? true : false
  end

  def display_bracket

    # display_hash is only necessary to to help avoid developer confusion over what's supposed to be printed by the 'puts' methods at the bottom of display_bracket.
    # => Within this hash, each string to be printed by display_bracket is formed from the Bracket Object's data and formatted to print correctly.
    # => :team1, :line_break, and :team2 values are all formatted using .fill() to add extra white space and match the length of :label. This formatting is necessary to 'puts' more than one piece of line data to the same line in the wildcard and divisional playoff rounds.
    # => Each :label includes the game's date and title.
    # => :team1 and :team2 both include the team's name and score for that particular game.

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

    # ---------------------------------
    # Prints the data from above to the terminal in a bracket format.

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
