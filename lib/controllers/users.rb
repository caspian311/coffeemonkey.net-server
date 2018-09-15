
get '/users' do
  halt_unless_valid_session
  json User.all
end

delete '/users/:id' do
  halt_unless_valid_session
  User.find(params[:id]).delete
end
