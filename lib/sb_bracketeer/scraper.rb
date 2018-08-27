class SbBracketeer::Scraper
  # Loads an array of html data from a specified url.
  def self.load(url)
    doc = Nokogiri::HTML(open(url))
  end

  def self.load_bracket_data(year)

    @data ||= (puts "****** Scraping Bracket"; SbBracketeer::Scraper.load('https://www.footballdb.com/seasons/nfl/' + year.to_s))
    @data.css("table.statistics.scrollable tbody tr.left")
  end

  def self.load_roster(team, year)
    puts "****** Scraping Roster"
    data = SbBracketeer::Scraper.load('https://www.footballdb.com/teams/nfl/' + team.split(' ').join('-').to_s + '/roster/' + year.to_s + '?sort=num')
    data.css("div.divtable.divtable-striped.divtable-mobile .tr")
  end
end
