require 'rest-client'
require 'json'
require 'pry'

def get_hash(url)
  url ? JSON.parse(RestClient.get(url)) : nil
end

def get_character_movies_from_api(character_name)
  url = 'http://www.swapi.co/api/people/'
  response_hash = get_hash(url)
  next_results = get_hash(response_hash["next"])
  all_characters = []

  while next_results
    all_characters += response_hash["results"]
    response_hash = next_results
    next_results = get_hash(response_hash["next"])
  end
  all_characters += response_hash["results"]
  
  film_urls = all_characters.find do |character|
    if character
      character["name"].downcase == character_name
    end
  end["films"]
  
  film_urls.map do |film_url|
    get_hash(film_url)
  end
end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  films.each do |film_info|
    puts film_info["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
