def welcome
  puts "Welcome to Star Wars API!"
end

def get_character_from_user
  puts "please enter a character name"
  character_name = gets.chomp.downcase
  return character_name
  # use gets to capture the user's input. This method should return that input, downcased.
end
