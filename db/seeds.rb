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

10.times do |_car|
  name = Faker::Vehicle.make
  overview = Faker::Vehicle.standard_specs
  poster_url = "https://source.unsplash.com/random/?#{name}"
  rating = rand(0..5)
  Car.create!(name: name, overview: overview[0], poster_url: poster_url, rating: rating)
end

puts 'Finished!'
