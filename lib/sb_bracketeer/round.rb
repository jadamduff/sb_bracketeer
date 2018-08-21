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
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data[0])
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data[1])
      round.game3 = SbBracketeer::Game.create_by_round_data(round, round_data[2])
      round.game4 = SbBracketeer::Game.create_by_round_data(round, round_data[3])
    when "divisional_round"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data[4])
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data[5])
      round.game3 = SbBracketeer::Game.create_by_round_data(round, round_data[6])
      round.game4 = SbBracketeer::Game.create_by_round_data(round, round_data[7])
    when "conference_championship"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data[8])
      round.game2 = SbBracketeer::Game.create_by_round_data(round, round_data[9])
    when "super_bowl"
      round.game1 = SbBracketeer::Game.create_by_round_data(round, round_data[10])
    end
    round
  end

  def self.load_round_data(year)
    data = SbBracketeer::Scraper.load_bracket_data(year)
    data.map do |game|
      team1_name = game.css('td.nowrap')[1].text.split(" @ ")[0].split(' ')
      team1_name[1] = team1_name[1].slice(0, (team1_name[1].length - 3))
      team1_name = [team1_name[0], team1_name[1]].join(' ')
      team2_name = game.css('td.nowrap')[1].text.split(" @ ")[0].split(' ')
      team2_name[1] = team2_name[1].slice(0, (team2_name[1].length - 3))
      team2_name = [team2_name[0], team2_name[1]].join(' ')
      {:date => game.css('td').first.text,
        :name => game.css('td.nowrap')[0].text,
        :team1 => team1_name,
        :team2 => team2_name,
        :team1_score => game.css('td.nowrap')[1].text.split(" @ ")[0].split(' ')[2],
        :team2_score => game.css('td.nowrap')[1].text.split(" @ ")[1].split(' ')[2]
      }
    end
  end


end
