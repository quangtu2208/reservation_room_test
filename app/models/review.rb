class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location

  after_create :rate_calculate

  private
  def rate_calculate
    average_rate = self.location.reviews.average(:rate)
    self.location.update_columns(total_rate: average_rate)
  end
end
