
post '/register' do
  halt 409 if get_user

  user = User.create username: params['username'],
    password: params['password'],
    first_name: params['first_name'],
    last_name: params['last_name']
  json user
end

post '/usernameCheck' do
  halt 409 if get_user
  json message: "username is available"
end

def get_user
  return @user if @user
  @user = User.find_by(username: params['username'])
end
