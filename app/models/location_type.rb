class LocationType < ApplicationRecord
  has_many :locations

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.validates.location_type.maximum_name}
end
