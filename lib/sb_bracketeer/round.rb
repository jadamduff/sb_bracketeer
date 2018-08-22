# Bracket -> ROUND -> Game -> Team

class SbBracketeer::Round
  attr_accessor :type, :bracket, :game1, :game2, :game3, :game4 # Every round has 4 game attributes, but not all of them are used by every round. Wildcard_round and divisional_round use all 4, conference_championship uses 2, and super_bowl uses 1.
  def initialize(type)
    @type = type
  end

  # This is the only method that creates new SbBracketeer::Round Objects in the entire program. SbBracketeer::Round.new is never called anywhere else.
  def self.create_by_year_and_type(year, type, bracket)
    round = self.new(type)
    round.bracket = bracket # Creates a has_one relationship to the Bracket.
    round_data = load_round_data(year) # Loads an array of game hashes with info about each game in the bracket.
    case round.type
    when "wildcard_round"
      # The below code creates game objects and assigns them to Round attributes in the order of NFC Wildcard, NFC Wildcard, AFC Wildcard, AFC Wildcard.
      # => When the data is originally scraped, it's not in the correct order to be displayed in a bracket.
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("NFC")}.first)
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("NFC")}[1])
      round.game3 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("AFC")}.first)
      round.game4 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("AFC")}[1])
    when "divisional_round"
      # The below code creates game objects and assigns them to Round attributes based on whether the matching wildcard game's winner is one of the teams, and whether it is a Playoff game.
      # => If you don't match each divisional_round game to a wildcard_round game, the bracket can get jumbled.
      # => If you match a divisional_round game to a wildcard_round game without specifying that the game title include "Playoff" the wilcard game itself might be loaded instead.
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game1.winner.name || data[:team2] == round.bracket.wildcard_round.game1.winner.name) && data[:name].include?("Playoff")}.first)
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game2.winner.name || data[:team2] == round.bracket.wildcard_round.game2.winner.name) && data[:name].include?("Playoff")}.first)
      round.game3 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game3.winner.name || data[:team2] == round.bracket.wildcard_round.game3.winner.name) && data[:name].include?("Playoff")}.first)
      round.game4 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game4.winner.name || data[:team2] == round.bracket.wildcard_round.game4.winner.name) && data[:name].include?("Playoff")}.first)
    when "conference_championship"
      # The below code returns to creating game objects in the order of NFC, AFC.
      # => Creating these games based on the previous winner would also work, but we are able to use the shorter .include? method here because there are only 2 games.
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("NFC")}[4])
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("AFC")}[4])
    when "super_bowl"
      # For super_bowl, we only need to specify that the game comes from the last hash of data in the round_data array, which will always be the Super Bowl.
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data[10])
    end
    round
  end

  def self.load_round_data(year)
    # Returns an array of game data for the entire bracket.
    data = SbBracketeer::Scraper.load_bracket_data(year)
    data.map do |game|
      {:date => game.css('td').first.text,
        :name => game.css('td.nowrap')[0].text,
        :team1 => game.css('td.nowrap span.hidden-xs').first.text,
        :team2 => game.css('td.nowrap span.hidden-xs').last.text,
        :team1_score => game.css('td.nowrap')[1].text.split(" @ ")[0].split(' ').last,
        :team2_score => game.css('td.nowrap')[1].text.split(" @ ")[1].split(' ').last
      }
    end
  end


end
