class Ride < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :users, join_table: :rides_and_riders
  alias_attribute :riders, :users

  validates :title, :date, :duration, presence: true
end
