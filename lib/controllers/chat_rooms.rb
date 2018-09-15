
get '/chatRooms' do
  halt_unless_valid_session
  json ChatRoom.all
end


get '/chatRooms/:id' do
  halt_unless_valid_session
  chat_room = ChatRoom.find_by(id: params["id"]).to_json(include: {chat_messages: {include: :user}})
  parsed_data = JSON.parse chat_room
  json parsed_data
end

post '/chatRooms/:id/message' do
  halt_unless_valid_session
  ChatMessage.create!(
    chat_room_id: params["id"],
    user_id: current_user.id,
    message: params["new_message"])
  json({ message: "all good" })
end
