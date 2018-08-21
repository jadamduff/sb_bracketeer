class SbBracketeer::CLI

  def call
    welcome
    menu
  end

  def welcome
    puts "Welcome to Super Bowl Bracketeer!"

  end

  def menu
    years = (1978..2018).to_a.map {|x| x.to_s}
    input = nil
    while input != "exit"
      puts ""
      puts "Please do one of the following:"
      puts "  -- Enter a year to see that year's playoff bracket (1978 - 2018),"
      puts "  -- enter a year and team name to view that team's roster (Ex. 1992 Dallas Cowboys),"
      puts "  -- or enter 'exit'"
      puts ""
      input = gets.strip.to_s
      if years.include?(input)
        bracket_input = nil
        while bracket_input != 'back'
          puts ""
          puts "#{input} Bracket"
          puts ""
          puts "  -- Enter a team name to see their roster, or 'back' to return to the #{input} bracket:"
          puts ""
          bracket_input = gets.strip
          if bracket_input == "Chicago Bears"
            puts ""
            puts "Bears Roster"
            roster_input = nil
            while roster_input != 'back'
              puts ""
              puts "  -- Enter 'back' to return to the #{input} bracket:"
              puts ""
              roster_input = gets.strip
            end
          end
        end
      elsif input == "1992 Dallas Cowboys"
        puts ""
        puts "1992 Dallas Cowboys Roster"
      end
    end
  end

end
