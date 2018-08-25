
post '/register' do
  200
end

post '/usernameCheck' do
  data = JSON.parse(request.body.read) rescue nil
  username = data['username']
  user = User.find_by(username: username)
  halt 409 if user
  json message: "username is available"
end
