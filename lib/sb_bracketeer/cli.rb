class SbBracketeer::CLI

  def call
    welcome
    menu
  end

  def welcome
    puts "Welcome to Super Bowl Bracketeer!"

  end

  def menu
    years = (1990..2017).to_a.map {|x| x.to_s}
    input = nil
    while input != "exit"
      puts ""
      puts "Please do one of the following:"
      puts "  -- Enter a year to see that year's playoff bracket (1990 - 2017),"
      puts "  -- or enter 'exit'"
      puts ""
      input = gets.strip.to_s
      if years.include?(input)
        bracket = SbBracketeer::Bracket.new(input)
        bracket.display_bracket
        bracket_input = nil
        while bracket_input != 'back'
          puts "  -- Enter a team name to see their roster, or 'back' to select a different bracket:"
          puts ""
          bracket_input = gets.strip.downcase
          if bracket.valid_team?(bracket_input)
            bracket.display_roster(bracket_input)
          elsif bracket_input != "back"
            puts "Sorry, that team didn't make the playoffs in #{input}."
          end
        end
      elsif input != "exit"
        puts "Sorry, that's not a valid year!"
      end
    end
  end

end
