require 'rest-client'
require 'json'
require 'pry'

def get_film_url(character_name)
  film_url_array = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash['results'].each do |character|
    if character['name'].downcase.include?(character_name)
      film_url_array << character['films']
    end
  end
  film_url_array
end

def url_to_film_name(film_url_array)
  film_array = []
  film_url_array.flatten.each do |film_url|
    film_response = RestClient.get(film_url)
    film_hash = JSON.parse(film_response)
    film_array << film_hash['title']
  end
  film_array
end

def get_character_movies_from_api(character_name)
  film_url_array = get_film_url(character_name)
  url_to_film_name(film_url_array)
end

def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index + 1}. #{film}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods? yes
