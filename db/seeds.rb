# This will delete any existing rows from the Toy and Kid tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting toy/kid data..."
Toy.destroy_all
Kid.destroy_all

puts "Creating toys..."
woody = Toy.create(name: "Woody", price: 10)
buzz = Toy.create(name: "Buzz Lightyear", price: 100)
bopeep = Toy.create(name: "Bo-Peep", price: 20)
slinky = Toy.create(name: "Slinky", price: 30)
rex = Toy.create(name: "Rex", price: 25)
potato = Toy.create(name: "Mr. Potato Head", price: 5)

puts "Creating kids..."
andy = Kid.create(name: "Andy")
sid = Kid.create(name: "Sid")

puts "Creating purchases..."
# ***********************************************************
# * TODO: create purchases! Remember, a role belongs to a toy *
# * and a role belongs to an kid.                         *
# ***********************************************************
# Create Purchases Here

Purchase.create(quantity: 4, kid: andy, toy: buzz)
Purchase.create(quantity: 6, kid: andy, toy: woody)
Purchase.create(quantity: 1, kid: sid, toy: bopeep)
Purchase.create(quantity: 2, kid: sid, toy: slinky)
Purchase.create(quantity: 8, kid: andy, toy: rex)
Purchase.create(quantity: 3, kid: sid, toy: potato)

puts "Seeding done!"