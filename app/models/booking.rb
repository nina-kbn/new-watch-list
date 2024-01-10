class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :comment, presence: true, length: { minimum: 10 }
end
