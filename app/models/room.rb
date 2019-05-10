class Room < ApplicationRecord
  has_many :services
  has_many :services, through: :rooms_services
  has_many :images, as: :imageable, dependent: :destroy
  has_many :reservation_details
  has_many :reservations, through: :reservation_details
  belongs_to :location
  belongs_to :bed_detail
end
