require "json"
require 'open-uri'


puts "cleaning seeds"

User.destroy_all
Dwarf.destroy_all
Rental.destroy_all
Review.destroy_all

puts "starting seeds"

seeding_users = ["jerryphilippe", "evanshulot", "leeloom", "ManueGI", "PaulJhonson26", "paultursuru", "LauraPerson", "phsyko92", "MihajaRz", "ThbltLmr", "RayanAnser", "kabolindustrie", "Empty-n", "ghbozz", "Adamogu"]
@descriptions = [
  "Avec sa barbe hirsute, ses vêtements déchirés et son regard défiant, ce nain de jardin insuffle un esprit punk et rebelle à votre jardin.",
  "Dotée de fleurs colorées dans ses cheveux et d'un sourire chaleureux, cette naine apporte une touche de charme et de gaieté à votre espace extérieur.",
  "Son chapeau tordu, sa pelle cassée et ses vêtements de travail témoignent d'un travail acharné et constant, rendant ce nain idéal pour un jardin décontracté et rustique.",
  "Avec sa canne à pêche à la main, son tablier à carreaux et son sourire tranquille, ce nain de jardin incarne parfaitement la tranquillité et la sérénité d'un après-midi ensoleillé.",
  "Armée d'un pinceau et vêtue d'un tablier taché de peinture, cette naine de jardin évoque l'inspiration et la créativité, parfaite pour un jardin artistique.",
  "Avec son râteau, sa mine joyeuse et son tablier à fleurs, ce nain de jardin garantit un espace extérieur rempli d'humour et de gaieté.",
  "Sa robe à pois, son arrosoir rose et son sourire malicieux font de cette naine de jardin l'accessoire parfait pour apporter une note de fantaisie et de malice à votre jardin.",
  "Son chapeau tordu, sa pelle cassée et ses vêtements de travail témoignent d'un travail acharné et constant, rendant ce nain idéal pour un jardin décontracté et rustique.",
  "Avec sa canne à pêche à la main, son tablier à carreaux et son sourire tranquille, ce nain de jardin incarne parfaitement la tranquillité et la sérénité d'un après-midi ensoleillé.",
  "Armée d'un pinceau et vêtue d'un tablier taché de peinture, cette naine de jardin évoque l'inspiration et la créativité, parfaite pour un jardin artistique.",
  "Avec son râteau, sa mine joyeuse et son tablier à fleurs, ce nain de jardin garantit un espace extérieur rempli d'humour et de gaieté.",
  "Sa robe à pois, son arrosoir rose et son sourire malicieux font de cette naine de jardin l'accessoire parfait pour apporter une note de fantaisie et de malice à votre jardin.",
  "Avec sa barbe hirsute, ses vêtements déchirés et son regard défiant, ce nain de jardin insuffle un esprit punk et rebelle à votre jardin.",
  "Dotée de fleurs colorées dans ses cheveux et d'un sourire chaleureux, cette naine apporte une touche de charme et de gaieté à votre espace extérieur.",
  "Son chapeau tordu, sa pelle cassée et ses vêtements de travail témoignent d'un travail acharné et constant, rendant ce nain idéal pour un jardin décontracté et rustique.",
  "Avec sa canne à pêche à la main, son tablier à carreaux et son sourire tranquille, ce nain de jardin incarne parfaitement la tranquillité et la sérénité d'un après-midi ensoleillé.",
  "Armée d'un pinceau et vêtue d'un tablier taché de peinture, cette naine de jardin évoque l'inspiration et la créativité, parfaite pour un jardin artistique.",
  "Avec son râteau, sa mine joyeuse et son tablier à fleurs, ce nain de jardin garantit un espace extérieur rempli d'humour et de gaieté.",
  "Sa robe à pois, son arrosoir rose et son sourire malicieux font de cette naine de jardin l'accessoire parfait pour apporter une note de fantaisie et de malice à votre jardin.",
  "Son chapeau tordu, sa pelle cassée et ses vêtements de travail témoignent d'un travail acharné et constant, rendant ce nain idéal pour un jardin décontracté et rustique.",
  "Avec sa canne à pêche à la main, son tablier à carreaux et son sourire tranquille, ce nain de jardin incarne parfaitement la tranquillité et la sérénité d'un après-midi ensoleillé."
]
@paris_addresses_1 = [
  "12 Rue de Rivoli, 75004 Paris",
  "35 Avenue de la Bourdonnais, 75007 Paris",
  "20 Boulevard Saint-Germain, 75005 Paris",
  "8 Rue de Charonne, 75011 Paris",
  "56 Avenue des Champs-Élysées, 75008 Paris",
  "27 Rue du Faubourg Saint-Antoine, 75012 Paris",
  "32 Boulevard de Strasbourg, 75010 Paris",
  "18 Avenue de Clichy, 75018 Paris",
  "50 Rue de la Roquette, 75011 Paris",
  "9 Boulevard de la Bastille, 75012 Paris",
  "22 Rue des Martyrs, 75009 Paris",
  "41 Boulevard Haussmann, 75009 Paris",
  "16 Rue Montorgueil, 75001 Paris",
  "3 Rue de la Paix, 75002 Paris",
  "50 Rue de la Roquette, 75011 Paris",
  "20 Boulevard Saint-Germain, 75005 Paris"
]
@paris_addresses_2 = [
  "18 Avenue de Clichy, 75018 Paris",
  "50 Rue de la Roquette, 75011 Paris",
  "9 Boulevard de la Bastille, 75012 Paris",
  "22 Rue des Martyrs, 75009 Paris",
  "41 Boulevard Haussmann, 75009 Paris",
  "16 Rue Montorgueil, 75001 Paris",
  "3 Rue de la Paix, 75002 Paris",
  "12 Rue de Rivoli, 75004 Paris",
  "35 Avenue de la Bourdonnais, 75007 Paris",
  "20 Boulevard Saint-Germain, 75005 Paris",
  "8 Rue de Charonne, 75011 Paris",
  "56 Avenue des Champs-Élysées, 75008 Paris",
  "27 Rue du Faubourg Saint-Antoine, 75012 Paris",
  "32 Boulevard de Strasbourg, 75010 Paris",
  "3 Rue de la Paix, 75002 Paris",
  "12 Rue de Rivoli, 75004 Paris"
]
@index = 0

seeding_users.each do |user_name|
  sleep(1)
  url = "https://api.github.com/users/#{user_name}"
  user_serialized = URI.open(url).read
  g_user = JSON.parse(user_serialized)
  user = User.new
  user.user_name = g_user['login']
  g_user['name'].nil? ? name = "#{g_user['login']} not-defined".split : name = g_user['name'].split
  user.email = "#{name.first}@nain.com"
  user.first_name = name.first
  user.last_name = name.last
  user.address = @paris_addresses_1[@index]
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!
  img = URI.open(g_user['avatar_url'])
  user.avatar.attach(io: img, filename: "#{g_user['login']}.jpeg", content_type: "image/jpeg")
  dwarf = Dwarf.new
  dwarf.name = "Nain-#{name.first}"
  dwarf.description = @descriptions[@index]
  dwarf.age = rand(5..99)
  dwarf.price = rand(15..75)
  dwarf.address = @paris_addresses_2[@index]
  dwarf.user_id = user.id
  dwarf.save!
  img = File.open("app/assets/images/#{g_user['login']}.png")
  dwarf.photo.attach(io: img, filename: "#{g_user['login']}.jpeg", content_type: "image/jpeg")
  @index += 1
end

Rental.destroy_all
Review.destroy_all

USERS = User.all
DWARVES = Dwarf.all
start_date = Date.parse('2024-01-11')
end_date = Date.parse('2025-12-31')

20.times do
  rental = Rental.new
  user = USERS[rand(0..(USERS.count)-1)]
  rental.user = user
  dwarf = DWARVES[rand(0..(DWARVES.count)-1)]
  rental.dwarf = dwarf
  rental.rental_begin = start_date + rand(end_date - start_date + 1)
  rental.rental_end = rental.rental_begin + 5
  rental.save!
end

RENTALS = Rental.all

RENTALS.each do |rental|
  review = Review.new
  review.user = rental.user
  review.dwarf = rental.dwarf
  review.rental = rental
  review.content = "Très bon nain"
  review.score = 4
  review.save!
end



puts "Seeds finish"
