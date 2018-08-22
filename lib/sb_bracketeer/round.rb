# Bracket -> ROUND -> Game -> Team

class SbBracketeer::Round
  attr_accessor :type, :bracket, :game1, :game2, :game3, :game4
  def initialize(type)
    @type = type
  end
  def self.create_by_year_and_type(year, type, bracket)
    round = self.new(type)
    round.bracket = bracket
    round_data = load_round_data(year)
    case round.type
    when "wildcard_round"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("NFC")}.first)
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("NFC")}[1])
      round.game3 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("AFC")}.first)
      round.game4 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("AFC")}[1])
    when "divisional_round"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game1.winner.name || data[:team2] == round.bracket.wildcard_round.game1.winner.name) && data[:name].include?("Playoff")}.first)
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game2.winner.name || data[:team2] == round.bracket.wildcard_round.game2.winner.name) && data[:name].include?("Playoff")}.first)
      round.game3 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game3.winner.name || data[:team2] == round.bracket.wildcard_round.game3.winner.name) && data[:name].include?("Playoff")}.first)
      round.game4 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| (data[:team1] == round.bracket.wildcard_round.game4.winner.name || data[:team2] == round.bracket.wildcard_round.game4.winner.name) && data[:name].include?("Playoff")}.first)
    when "conference_championship"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("NFC")}[4])
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data.select {|data| data[:name].include?("AFC")}[4])
    when "super_bowl"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data[10])
    end
    round
  end

  def self.load_round_data(year)
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
