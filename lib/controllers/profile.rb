
get '/profile' do
  halt_unless_valid_session
  user = User.find_by username: current_session[:username]
  payload = { first_name: user.first_name,
    last_name: user.last_name,
    selected_avatar: user.selected_avatar }
  json payload
end

put '/profile' do
   current_user.update({
     first_name: params["first_name"],
     last_name: params["last_name"],
     selected_avatar: params["selected_avatar"]
   })
  201
end
