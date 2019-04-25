require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

  test = response_hash["results"]
  test.each do |imdb|
    info = imdb["name"]
    if info == character_name
      imdb["films"]
    end
  end
  #this is an array of hashes
  #movies = level_above_movies["films"]
  #characters = level_above_movies["name"]
  #this is an array
  #character = character_name

  # level_above_movies.each do |array|
  #   array.each do |key, value|
  #     if value == character_name


  #     end
  #   end
  # end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
    # [
    # https://www.swapi.co/api/films/2/
    # https://www.swapi.co/api/films/6/
    # https://www.swapi.co/api/films/3/
    # https://www.swapi.co/api/films/1/
    # https://www.swapi.co/api/films/7/
    # ]
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
