def welcome
  # puts out a welcome message here!
  "Hello and welcome to Star Wars info!"
end

def get_character_from_user
  puts "please enter a character name: "
  character = gets.chomp
  return character
  # use gets to capture the user's input. This method should return that input, downcased.
end
