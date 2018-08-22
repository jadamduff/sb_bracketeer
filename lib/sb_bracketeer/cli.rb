class SbBracketeer::CLI

  def call
    welcome
    menu
  end

  def welcome
    puts ""
    puts "Welcome to Super Bowl Bracketeer!"

  end

  def menu
    years = (1990..2017).to_a.map {|x| x.to_s} # Makes an array of strings of all valid years.
    input = nil
    while input != "exit" # This starts a loop that will keep the program running until the user enters 'exit'.
      puts ""
      puts "Please do one of the following:"
      puts "  -- Enter a year to see that year's playoff bracket (1990 - 2017),"
      puts "  -- or enter 'exit'"
      puts ""
      input = gets.strip.to_s
      if years.include?(input) # Creates and displays a bracket if the user enters a valid year.
        bracket = SbBracketeer::Bracket.new(input)
        bracket.display_bracket
        bracket_input = nil
        while bracket_input != 'back' # Starts a loop that will keep going until the user enters 'back'.
          puts "  -- Enter a team name to see their roster, or 'back' to select a different bracket:"
          puts ""
          bracket_input = gets.strip.downcase
          if bracket.valid_team?(bracket_input) # This if statement validates that a valid team was entered and displays an error message if not.
            bracket.display_roster(bracket_input)
          elsif bracket_input != "back" # If != "back" isn't specified, the if statement will treat all input as a team name, even 'back'.
            puts "Sorry, that team didn't make the playoffs in #{input}."
          end
        end
      elsif input != "exit" # If != "exit" isn't specified, the if statement will treat all input as a team name, even 'exit'.
        puts "Sorry, that's not a valid year!"
      end
    end
  end

end
