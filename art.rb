require "http"

response = HTTP.get("https://data.nashville.gov/resource/dqkw-tj5j.json")

all_the_art = response.parse
p all_the_art
p response.parse[0].class

all_the_art.each do |art|
  p art['title']
end
