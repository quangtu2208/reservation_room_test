class Service < ApplicationRecord
  has_many :rooms
  has_many :rooms, through: :rooms_services
end
