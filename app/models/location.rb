class Location < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  belongs_to :user
  belongs_to :location_type
end
