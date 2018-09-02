users = [
  ["test", "Matt", "Todd", "pass", "a-06"],
  ["test2", "Abbi", "Todd", "pass", "a-10"],
]

chat_rooms = [ "Gaming", "Favorite movies"]

users.each do |username, first_name, last_name, password, avatar|
  User.create username: username,
    first_name: first_name,
    last_name: last_name,
    password: password,
    selected_avatar: avatar
end

chat_rooms.each do |name|
  ChatRoom.create name: name
end
