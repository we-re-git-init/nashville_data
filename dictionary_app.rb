require 'http'
require 'awesome_print'

# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions

# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.
# Bonus: Search for the audio section in the documentation. Use wordnik’s audio api to get the first fileUrl to open in the browser (you’ll need to google this!) and pronounce the name of the word.

while true
  system "clear"

  p "welcome to the dictionary app, please type your word below. type q to exit"
  user_input = gets.chomp

  if user_input == "q"
    break
  end

  # definitions
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

  definitions = response.parse

  p "printing out the definitions"

  definitions.each do |definition|
    p definition['text']
  end

  # top example
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/topExample?useCanonical=false&api_key=")

  top_example = response.parse['text']

  p "printing out the top example"
  p top_example

  # # pronunciation
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/pronunciations?useCanonical=false&limit=50&api_key=")

  pronunciations = response.parse

  p "printing out the pronunciations"
  pronunciations.each do |pronunciation|
    p pronunciation['raw']
  end
end



# p "definitions:"
# p definition

# p "top example"
# p top_example

# p "pronunciation:"
# p pronunciation



# # no user input DONE
# # only showing one definition DONE
# # user should be able to enter multiple words without exiting the program
