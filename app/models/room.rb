class Room < ApplicationRecord
  include RoomDecorator

  has_many :services
  has_many :services, through: :rooms_services
  has_many :images, as: :imageable, dependent: :destroy
  has_many :reservation_details
  has_many :reservations, through: :reservation_details
  belongs_to :location
  belongs_to :bed_detail

  mount_uploaders :pictures, PictureUploader

  validates_presence_of :name, :occupancy_limit, :living_room, :bed_room,
    :bath_room, :number_of_bed, :quantity
  accepts_nested_attributes_for :services

  ROOM_PARAMS = [:location, :name, :occupancy_limit, :living_room, :bed_room, :bath_room, :number_of_bed, :quantity, :price, :location_id, :bed_detail_id, :created_at, :updated_at, pictures: []].freeze

  scope :by_location_id, -> (location_id){ where("location_id = ?", location_id) }
  scope :list, ->{select :id, :name, :occupancy_limit, :living_room, :bed_room, :bath_room, :number_of_bed, :quantity, :price, :location_id, :bed_detail_id}
end
