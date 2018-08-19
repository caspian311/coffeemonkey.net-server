require 'sinatra'
require 'sinatra/json'
require 'sinatra/cross_origin'
require 'active_support/time'
require 'byebug'
require 'faker'

@@movies = [
  {
    id: 1,
    title: 'Star Wars: A New Hope',
    release_date: '1977'
  },
  {
    id: 2,
    title: 'Star Wars: Empire Strikes Back',
    release_date: '1980'
  },
  {
    id: 3,
    title: 'Star Wars: Return of the Jedi',
    release_date: '1983'
  },
  {
    id: 4,
    title: 'Indiana Jones: Raiders of the Lost Ark',
    release_date: '1981'
  },
  {
    id: 5,
    title: 'Indiana Jones and the Temple of Doom',
    release_date: '1984'
  },
  {
    id: 6,
    title: 'Indiana Jones and the Last Crusade',
    release_date: '1989'
  }
]
@@id = 6

get '/movies' do
  json movies: @@movies
end

post '/movies' do
  halt_unless_valid_session

  unless valid_title?
    puts '400: invalid title'
    halt 400
  end

  unless valid_year?
    puts '400: invalid year'
    halt 400
  end

  @@id += 1
  movie = {
    id: @@id,
    title: @title,
    release_date: @release_date,
  }

  @@movies << movie

  json movie
end

delete '/movies/:movie_id' do |movie_id|
  halt_unless_valid_session

  movie = @@movies.find{ |m| m[:id] == movie_id.to_i }
  unless movie
    halt 404
  end

  @@movies.delete(movie)
  json movie
end

def valid_title?
  return false unless data
  @title = data["title"]
  @title.to_s.empty? == false
end

def valid_year?
  return false unless data
  @release_date = data["year"]
  @release_date.to_s.empty? == false
end
