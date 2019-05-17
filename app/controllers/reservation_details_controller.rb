class ReservationDetailsController < ApplicationController

  def create
    @reservation_detail = current_user.reservation_details.create(reservation_detail_params)
    redirect_to @reservation_detail.room
  end

  private
    def reservation_detail_params
      params.require(:reservation_detail).permit(:start_date, :end_date, :description, :room_id)
    end
end
