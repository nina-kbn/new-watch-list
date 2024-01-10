class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :overview, presence: true
  validates :poster_url, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
