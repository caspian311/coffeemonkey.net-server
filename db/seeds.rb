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
