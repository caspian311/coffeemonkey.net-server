require 'bundler'
Bundler.require(:default, ENV.fetch('RACK_ENV', 'development'))

class CoffeeMonkeyApp < Sinatra::Base
  register Sinatra::ConfigFile
  register Sinatra::ActiveRecordExtension

  config_file 'config/config.yml'

  require File.join(root, '/config/initializers/autoloader.rb')
end

use CamelToSnake

configure do
  enable :cross_origin

  set :bind, "0.0.0.0"
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

options '*' do
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS, DELETE, PUT'
  response.headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token'
  response.headers['Access-Control-Allow-Origin'] = '*'
  200
end

before do
  update_current_session if valid_session?
end

def valid_session?
  current_session && Time.at(current_session[:expires_at]) > Time.now
end

def current_session
  puts "No auth token given!" unless env['HTTP_AUTHORIZATION']

  LoginSession.find_by auth_token: env['HTTP_AUTHORIZATION']
end

def halt_unless_valid_session
  halt 401 unless valid_session?
end

def update_current_session
  login_session = LoginSession.find_by(auth_token: env['HTTP_AUTHORIZATION'])
  login_session.update_attributes expires_at: 5.minutes.from_now
end

def data
  @data ||= JSON.parse(request.body.read) rescue nil
end

def current_user
  current_session.user
end
