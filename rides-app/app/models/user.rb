class User < ApplicationRecord
  has_secure_password

  has_many :owned_rides, class_name: "Ride"
end
