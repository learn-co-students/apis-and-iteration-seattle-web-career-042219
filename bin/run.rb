#!/usr/bin/env ruby

# team @jkvyff and @ButlerBorst

require 'pry'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)