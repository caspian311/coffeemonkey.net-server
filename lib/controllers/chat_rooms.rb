
get '/chatRooms' do
  halt_unless_valid_session
  chat_rooms = ChatParticipant
    .joins(:chat_room)
    .group(:chat_room_id)
    .select('chat_rooms.id as id, chat_rooms.name as name, count(*) as number_of_participants, chat_rooms.created_at as last_updated')
    .map do |chat_room|
      { id: chat_room.id,
        name: chat_room.name,
        number_of_participants: chat_room.number_of_participants,
        last_updated: chat_room.last_updated.strftime("%m/%d/%Y %I:%M:%p") }
    end

    json chat_rooms
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

post '/chatRooms/:id/membership' do
  halt_unless_valid_session
  ChatParticipant.create!(
    chat_room_id: params["id"],
    user_id: current_user.id)
  json({ message: "all good" })
end
