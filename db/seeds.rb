# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Dwarf.destroy_all

user = User.create!(email: "popol@gmail.com", password: "bonjour")

dwarf = Dwarf.new(name: "michel", description: "grand et mignon", age: 12, address:"pas loin")

dwarf.user = user

dwarf.save!

puts "seeds done"
