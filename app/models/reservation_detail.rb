class ReservationDetail < ApplicationRecord
  DATE_TIME_REGEX = /\d{4}\-\d{2}\-\d{2}/

  belongs_to :reservation
  belongs_to :room

  validates :start_date, presence: true, format: {with: DATE_TIME_REGEX}
  validates :end_date, presence: true, format: {with: DATE_TIME_REGEX}
end
