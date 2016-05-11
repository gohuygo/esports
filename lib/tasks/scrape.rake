namespace :scrape do
  desc 'Scrape for pros'

  task pros: :environment do
    require 'nokogiri'
    require 'open-uri'

    puts "Fetching and updating Players:"
    puts "Source: http://dota2.gamepedia.com/Professional_players"
    url = "http://dota2.gamepedia.com/Professional_players"
    doc = Nokogiri::HTML(open(url))

    headers = []
    pros = []
    i = 1
    doc.css('.wikitable').each do |rows|
      count = rows.children.count
      header = rows.children[1].search('th').text
      headers << header

      while i < count do
        handle_name = rows.children[i+2].children[1].text.strip rescue nil
        real_name   = rows.children[i+2].children[3].text.strip rescue nil
        country     = rows.children[i+2].children[5].text.strip rescue nil

        if handle_name
          puts "#{handle_name}, #{real_name}, #{country}"
          pros << {handle_name: handle_name, real_name: real_name}
        end
        i += 1
      end
    end
    headers = headers.first.split("\n") # [ ID, Name, Country, Team/Former Team, Stream ]

    pros.each do |pro|
      handle_name = pro[:handle_name]
      real_name = pro[:real_name]

      player = Player.find_or_initialize_by(handle_name: handle_name)
      player.update_attributes(real_name: real_name)
    end
  end
end
