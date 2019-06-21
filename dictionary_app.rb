require 'http'

# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions

# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.
# Bonus: Search for the audio section in the documentation. Use wordnik’s audio api to get the first fileUrl to open in the browser (you’ll need to google this!) and pronounce the name of the word.


# definitions
response = HTTP.get("https://api.wordnik.com/v4/word.json/hippo/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

definition = response.parse[0]['text']


# top example
response = HTTP.get("https://api.wordnik.com/v4/word.json/hippo/topExample?useCanonical=false&api_key=")

top_example = response.parse['text']


# pronunciation
response = HTTP.get("https://api.wordnik.com/v4/word.json/hippo/pronunciations?useCanonical=false&limit=50&api_key=")

pronunciation = response.parse[0]['raw']


p "definitions:"
p definition

p "top example"
p top_example

p "pronunciation:"
p pronunciation
