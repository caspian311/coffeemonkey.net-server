
get '/chatRooms' do
  halt_unless_valid_session
  json ChatRoom.all
end
