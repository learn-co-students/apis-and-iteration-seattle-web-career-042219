def welcome
  "Welcome to the Star Wars character finder"
end

def get_character_from_user
  puts "please enter a character name"
  query = gets.chomp
  query.downcase
end