users = [
  ["test", "Matt", "Todd", "pass", "a-06"],
  ["test2", "Abbi", "Todd", "pass", "a-10"],
]

users.each do |username, first_name, last_name, password, avatar|
  User.create username: username,
    first_name: first_name,
    last_name: last_name,
    password: password,
    selected_avatar: avatar
end

chat_rooms = [ "Gaming", "Favorite movies"]

chat_rooms.each do |name|
  ChatRoom.create name: name
end

ChatMessage.create message: "Final Fantasy 7 is the best!",
  user: User.all.first,
  chat_room: ChatRoom.all.first


ChatMessage.create message: "Mass Effect is the bestest!",
  user: User.all.last,
  chat_room: ChatRoom.all.first
