require "http"

while true
  system "clear"
  puts "Welcome to the Dictionary App!"
  print "Enter a word: "
  input_word = gets.chomp

  response = HTTP.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=_____")
  definitions = response.parse

  response = HTTP.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=_____")
  top_example = response.parse

  puts "DEFINITIONS:"
  index = 0
  definitions.length.times do
    definition = definitions[index]
    puts "#{index + 1}. #{definition['text']}"
    puts
    index = index + 1
  end

  puts "TOP EXAMPLE"
  puts top_example["text"]
  puts

  puts "Enter q to quit, any other key to continue"
  input_choice = gets.chomp
  if input_choice == "q"
    puts "Thank you, goodbye!"
    break
  end
end
