# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts 'Cleaning database...'
Booking.destroy_all
Car.destroy_all
User.destroy_all

puts 'Creating users...'
10.times do |_user|
  email = Faker::Internet.email(domain: 'gmail.com')
  password = "azerty"
  User.create!(email: email, password: password)
end

puts 'Creating cars...'

# Liste pour stocker les noms générés
generated_names = []

10.times do |_car|
  name = Faker::Vehicle.make

  # Vérifier si le nom existe déjà dans la liste
  while generated_names.include?(name)
    name = Faker::Vehicle.make
  end

  # Ajouter le nom à la liste
  generated_names << name

  # Les autres attributs
  overview = Faker::Vehicle.standard_specs
  poster_url = "https://source.unsplash.com/random/?#{name}"
  rating = rand(1..5)
  price = rand(10..100)


  # Créer l'objet Car avec le nom unique
  Car.create!(name: name, overview: overview[0], poster_url: poster_url, rating: rating, price: price)
end


puts 'Finished!'
