class SbBracketeer::Roster
  attr_accessor :team_name, :year, :roster_arr

  @@rosters = []

  def initialize(team_name, year)
    @team_name = team_name
    @year = year
    @roster_arr = []
  end

  def self.create_or_return_roster_by_team_and_year(team_name, year)
    roster_test = @@rosters.detect {|x| x.team_name == team_name && x.year == year}
    if roster_test
      return roster_test.roster_arr
    else
      new_roster = SbBracketeer::Roster.new(team_name, year)
      data = SbBracketeer::Scraper.load_roster(team_name, year)
      data.each do |data|
        num = data.css('div.td.w10.m20.rostercell_num').first.text
        player = data.css('div.td.w20.m80.rostercell_name .rostplayer b a').first.text
        row = num.to_s + " " + player.to_s
        new_roster.roster_arr << row
      end
      @@rosters << new_roster
      new_roster.roster_arr
    end
  end

end
