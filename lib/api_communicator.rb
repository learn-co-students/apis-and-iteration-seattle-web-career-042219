require 'rest-client'
require 'json'
require 'pry'

def helper_get_character_films(results, character_name)
  character_films = []
  results.each do |character|
    if character["name"].downcase == character_name
      character_films = character["films"]
    end
  end
  character_films
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
  results = response_hash["results"]
  character_films = helper_get_character_films(results, character_name)
  character_films.map do |request|
    JSON.parse(RestClient.get(request))
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts "Star Wars #{film["title"]}, Episode #{film["episode_id"]}"
    puts "Directed by #{film["director"]}, Produced by #{film["producer"]}"
    puts "Release date: #{film["release_date"]}"
    puts
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS


# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
