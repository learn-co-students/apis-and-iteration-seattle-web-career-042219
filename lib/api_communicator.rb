require 'rest-client'
require 'json'
require 'pry'



def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  num_chars = response_hash["count"]
  character_count = 1

  num_chars.times do

    individual_char_response = RestClient.get("http://www.swapi.co/api/people/#{character_count.to_s}/")

    if individual_char_response.code == 200
      individual_char_hash = JSON.parse(individual_char_response)

      character_count += 1

      film_info = []

      if individual_char_hash["name"] == character_name && individual_char_hash["films"]
          individual_char_hash["films"].each do |film_url|
          film_find_string = RestClient.get("#{film_url}")
          film_find_hash = JSON.parse(film_find_string)
          film_info << film_find_hash
        end
        return film_info
      end
    end
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
