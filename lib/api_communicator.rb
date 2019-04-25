require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  url_array = []
  film_info = []

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |character|
    if character["name"] == character_name
      url_array = character["films"]
    end

  end

    url_array.each do |film_url|
      film_string = RestClient.get(film_url)
      film_info << JSON.parse(film_string)
    end
      film_info
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list

  films.each do |film_hash|
    title = film_hash["title"]
    episode = film_hash["episode_id"]
    release_date = film_hash["release_date"]

    puts ""
    puts "title: #{title}"
    puts "episode number: #{episode}"
    puts "release date: #{release_date}"

  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)

end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
