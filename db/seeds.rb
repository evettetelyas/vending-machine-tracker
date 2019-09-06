# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

evette = Owner.create(name: "Evette")
mac1 = evette.machines.create(location: "Turing School")
mac2 = evette.machines.create(location: "Not Turing School")
sn1 = Snack.create(name: "Twizzlers", price: 12.5, machines: [mac1, mac2])
sn2 = mac1.snacks.create(name: "M&M", price: 1.5)
sn3 = mac1.snacks.create(name: "Candytown", price: 3.5)