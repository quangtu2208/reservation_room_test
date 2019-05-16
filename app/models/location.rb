class Location < ApplicationRecord
  include LocationDecorator

  has_many :reviews, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  belongs_to :user
  belongs_to :location_type

  mount_uploaders :pictures, PictureUploader

  validates_presence_of :name, :location, :national, :zip_code, :description, :status

  LOCATION_PARAMS = [:name, :location, :national, :zip_code, :description, :status, :location_type_id, :user_id, :created_at, :updated_at, pictures: []].freeze

  scope :list, ->{select :id, :name, :location, :national, :zip_code,
    :description, :status, :location_type_id, :user_id, :created_at, :updated_at}
end
