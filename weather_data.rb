require 'http'


p "please enter the city you would like to know the weather of"
user_input = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{user_input}&APPID=&units=imperial")

temperature = response.parse['main']['temp']

description = response.parse['weather'][0]['description']

city_name = response.parse['name']

p "It is #{temperature} and #{description} in #{city_name}"

# temperature
# weather description
# city

# print out a sentence that says

# "it's 74 degrees and sunny in nashville"
