
get '/users' do
  halt_unless_valid_session
  foo = User.includes(:login_sessions).all.map do |user|
    {
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      username: user.username,
      last_login: user.last_login,
    }
  end
  json foo
end

delete '/users/:id' do
  halt_unless_valid_session
  User.find(params[:id]).delete
end
