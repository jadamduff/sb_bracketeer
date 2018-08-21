require 'nokogiri'
require 'open-uri'

class SbBracketeer::Scraper
  def self.load(url)
    doc = Nokogiri::HTML(open(url))
    doc
  end

  def self.load_bracket_data(year)
    data = SbBracketeer::Scraper.load('https://www.footballdb.com/seasons/nfl/' + year.to_s)
    data.css("table.statistics.scrollable tbody")
  end
end
