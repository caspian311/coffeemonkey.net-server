
get '/chatRooms' do
  halt_unless_valid_session
  json ChatRoom.all
end


get '/chatRooms/:id' do
  halt_unless_valid_session
  ChatRoom.find_by(id: 1).to_json(include: {chat_messages: {include: :user}})
end
