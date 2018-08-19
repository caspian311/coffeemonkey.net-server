require 'sinatra'
require 'sinatra/json'
require 'active_support/time'
require 'byebug'
require 'faker'

@@sessions = {}

post '/login' do
  user = find_user

  unless user
    puts '401: invalid creds'
    halt 401
  end

  auth_token = SecureRandom.uuid
  payload = { auth_token: auth_token,
              first_name: user.first_name,
              last_name: user.last_name,
              selected_avatar: user.selected_avatar,
              expires_at: 5.minutes.from_now.utc.to_i }
  @@sessions[auth_token] = { username: user.username,
                             auth_token: auth_token,
                             expires_at: 5.minutes.from_now.utc.to_i  }

  json payload
end

def find_user
  login = JSON.parse(request.body.read) rescue nil
  return false unless login

  User.find_by(username: login['username'], password: login['password'])
end
