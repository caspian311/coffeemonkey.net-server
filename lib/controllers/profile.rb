
get '/profile' do
  halt_unless_valid_session
  payload = { first_name: current_user.first_name,
    last_name: current_user.last_name,
    selected_avatar: current_user.selected_avatar }
  json payload
end

put '/profile' do
  updated_profile = {
    first_name: params["first_name"],
    last_name: params["last_name"],
    selected_avatar: params["selected_avatar"]
  }
  current_user.update(updated_profile)
  json updated_profile
end
