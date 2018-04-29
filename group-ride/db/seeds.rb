# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ride.destroy_all
User.destroy_all

User.create(name: "Dmitry", email: "dmitry@gmail.com", password: "test", password_confirmation: "test")
User.create(name: "Lily", email: "lily@gmail.com", password: "test", password_confirmation: "test")

Ride.create(
  title: "Dmitry's commute",
  date: Date.today + 50,
  duration: 0.2,
  distance: 3.8,
  location: "Toronto",
  intensity: "low",
  drop: false,
  number_of_riders: 1,
  elevation_gain: 20,
  description: "commute to bitmaker",
  organizer: User.find_by(name: "Dmitry")
)

Ride.create(
  title: "Lily's commute",
  date: Date.today + 20,
  duration: 0.2,
  distance: 4.5,
  location: "Toronto",
  intensity: "low",
  drop: false,
  number_of_riders: 1,
  elevation_gain: 5,
  description: "commute to bitmaker",
  organizer: User.find_by(name: "Lily")
)
