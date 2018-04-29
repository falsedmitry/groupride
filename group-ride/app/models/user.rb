class User < ApplicationRecord
  has_many :owned_rides, class_name: "Ride"
  has_and_belongs_to_many :rides, join_table: :rides_and_riders

  has_secure_password

  validates :name, :email, presence: true
end
