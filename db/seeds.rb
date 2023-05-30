require "json"
require "open-uri"

seeding_users = ["jerryphilippe", "evanshulot", "leeloom", "ManueGI"]

seeding_users.each do |user_name|
  url = "https://api.github.com/users/#{user_name}"
  user_serialized = URI.open(url).read
  g_user = JSON.parse(user_serialized)
  user = User.new
  user.user_name = g_user['login']
  g_user['name'].nil? ? name = "No Name".split : name = g_user['name'].split
  user.email = "#{name.first}@nain.com"
  user.first_name = name.first
  user.last_name = name.last
  user.address = "68 Ave Parmentier 75011 Paris"
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!
  img = URI.open(g_user['avatar_url'])
  user.avatar.attach(io: img, filename: "#{g_user['login']}.jpeg", content_type: "image/jpeg")
  dwarf = Dwarf.new
  dwarf.name = "Dwarf-#{name.first}"
  dwarf.description = "Dwarf-#{name.first} is a very nice dwarf will fit in every garden"
  dwarf.age = rand(5..99)
  dwarf.address = "16 Villa Gaudelet, 75011 Paris"
  dwarf.user_id = user.id
  dwarf.save!
  img = File.open("app/assets/images/#{g_user['login']}.png")
  dwarf.photo.attach(io: img, filename: "#{g_user['login']}.jpeg", content_type: "image/jpeg")
end
