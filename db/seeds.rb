# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Reservation.destroy_all
FoodTruck.destroy_all
User.destroy_all

puts "Creating users"
user1 = User.create(email: 'henri@jaimelafete.ch', password: '123456' , food_truck_owner: false, name: 'Henri', description: "Hello, je suis Henri, de Gland. J'aime inviter tous mes amis à des soirées spéciales foodtruck pour leur faire goûter des spécalités du monde entier, mais en Suisse absolument! A tout bientôt!")
user2 = User.create(email: 'andrea@gmail.com', password: '123456' , food_truck_owner: false, name: 'Andrea Designato', description: "Hi, I am new on Foodtruckr. I'd like to invite my firends for a special event foodtruck party.")
foodtrucker1 = User.create(email: 'jo@lafrite.be', password: '123456' , food_truck_owner: true, name: 'Jojo', description: "Bonjour, c'est moi Jojo, l'expert de la frite.")
foodtrucker2 = User.create(email: 'mehmet@istanbul.tr', password: '123456' , food_truck_owner: true, name: 'Mehmet Soyak', description: "Hi, I'm Mehmet. If you don't know already know the delighfulness of the turkish cuisine, I am your man for your event night.")
foodtrucker3 = User.create(email: 'jamie@fromBeijin.com', password: '123456' , food_truck_owner: true, name: 'Jamie Chang', description: "Very good food, very good price... What else?")
foodtrucker4 = User.create(email: 'john@burger.ch', password: '123456' , food_truck_owner: true, name: 'John Carey', description: "Best Burger is my specialty.")
foodtrucker5 = User.create(email: 'lisa@vegan.ch', password: '123456' , food_truck_owner: true, name: 'Lisa', description: "Namaste! I am Lisa, and I like to cook veggie and vegan.")
foodtrucker6 = User.create(email: 'angelo@casamia.it', password: '123456' , food_truck_owner: true, name: 'Angelo', description: "Ciao ragazzi, I am new on Foodtruckr but ready to serve my best cook.")
foodtrucker7 = User.create(email: 'amelie@gastroburger.ch', password: '123456' , food_truck_owner: true, name: 'Amelie Servette', description: "Fancy burger is my moto.")


puts "Creating foodtrucks"
food_truck1 = FoodTruck.create(name: 'Jojo La Frite', category: 'belgian', city: 'Bruxelles', description: 'Je suis votre partenaire idéal pour une soirée mémorable! Goutez à nos frites formidables!', user_id: foodtrucker1.id, photo: "assets/images/belgian.jpg", price_cents: 8500)
food_truck2 = FoodTruck.create(name: 'Istanbul delices', category: 'turkish', city: 'Istanbul', description: 'My foodtruck is robust enough to cross the oceans and cook for you. Contact me on Foodtruckr.com for any of your foodtruck party!', user_id: foodtrucker2.id, photo: "assets/images/turkish.jpg" , price_cents: 20000)
food_truck3 = FoodTruck.create(name: 'The Pekin Duck', category: 'chinese', city: 'Pekin', description: 'Hello my friends, book my foodtruck for one night or very many. Very good chinese food, very good price. You will be very satisfied, for sure!', user_id: foodtrucker3.id, photo: "assets/images/chinese.jpg" , price_cents: 16000)
food_truck4 = FoodTruck.create(name: 'Be Burger', category: 'burgers', city: 'Renens', description: 'Ready to taste your best burger of your life? Invite your buddies and reserve my foodtruck for one night', user_id: foodtrucker4.id, photo: "assets/images/burger.jpg" , price_cents: 100000)
food_truck5 = FoodTruck.create(name: 'Vegan style', category: 'vegan', city: "Lausanne, Avenue d'Ouchy", description: 'Eat and Love... Our foodtruck will be your best partner for your event', user_id: foodtrucker5.id, photo: "assets/images/vegan.jpg" , price_cents: 15000)
food_truck6 = FoodTruck.create(name: 'A casa mia', category: 'italian', city: "Lausanne, Avenue de Cour", description: 'Ciao a tutti! You love pizza and pasta? Good news! Scoprite la vera cucina italiana con Angelo e suo foodtruck.', user_id: foodtrucker6.id, photo: "assets/images/italian.jpg" , price_cents: 17000)
food_truck7 = FoodTruck.create(name: 'Gastro Burger', category: 'burgers', city: "Geneva", description: 'You like Gastronomy and Burger? Now, make your reservation on Foodtruckr!', user_id: foodtrucker7.id, photo: "assets/images/burger_gourmet.jpg" , price_cents: 15000)



puts "Creating reservations"
reservation1 = Reservation.create(checkin_date: '27/11/2019', checkout_date: '28/11/2019', accepted_at: nil, paid_at: nil, state: "Not accepted yet", amount_cents: 8500, user_id: user1.id, food_truck_id:food_truck1.id)
reservation2 = Reservation.create(checkin_date: '28/11/2019', checkout_date: '30/11/2019', accepted_at: '19/11/2019', paid_at: nil, state: "Accepted at 19/11/2019", amount_cents: 17000, user_id: user2.id, food_truck_id:food_truck1.id)
reservation3 = Reservation.create(checkin_date: '01/12/2019', checkout_date: '06/12/2019', accepted_at: '20/11/2019', paid_at: '21/11/2019', state: "Paid at 21/11/2019", amount_cents: 100000, user_id: user1.id, food_truck_id:food_truck2.id)
