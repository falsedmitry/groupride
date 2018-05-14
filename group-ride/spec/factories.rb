FactoryBot.define do

  factory :user do
    name "User"
    email "user@gmail.com"
    password "testtest"
    password_confirmation "testtest"
  end

  factory :ride do
    title "Donut"
    date Date.tomorrow
    duration 2.0
    distance 100.0
    location "Jane"
    intensity "intense"
    drop true
    number_of_riders 10
    elevation_gain 1000
    description "Fast!"
    image "no photos allowed"
  end
  
end
