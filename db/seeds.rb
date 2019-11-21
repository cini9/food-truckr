# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Reservation.destroy_all
FoodTruck.destroy_all
User.destroy_all

puts "Creating users"
user1 = User.create(email: 'henri@jaimelafete.ch', password: '123456' , food_truck_owner: false, name: 'Henri', description: "Hello, je suis Henri, de Gland. J'aime inviter tous mes amis à des soirées spéciales foodtruck pour leur faire goûter des spécalités du monde entier, mais en Suisse seulement! A tout bientôt!")
user2 = User.create(email: 'hello@jaimelafete.ch', password: '123456' , food_truck_owner: false, name: 'Henri', description: "Hello, je suis Henri, de Gland. J'aime inviter tous mes amis à des soirées spéciales foodtruck pour leur faire goûter des spécalités du monde entier, mais en Suisse seulement! A tout bientôt!")

puts "Creating foodtrucks"
food_truck1 = FoodTruck.create(name: 'JojoLaFrite', category: 'belgian', city: 'Bruxelles', description: 'Je suis votre partenaire idéal pour une soirée mémorable! Goutez à nos frites formidables!', user_id: user2.id, photo: "" , price_cents: 8500)

puts "Creating reservations"
reservation1 = Reservation.create(checkin_date: '27/11/2019', checkout_date: '28/11/2019', accepted_at: nil, paid_at: nil, state: "Not accepted yet", amount_cents: 8500, user_id: user1.id, food_truck_id:food_truck1.id)
