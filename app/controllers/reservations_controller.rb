class ReservationsController < ApplicationController
  before_action :load_reservations, only: %i(show)
  before_action :logged_in_user, only: :create
  def create
    @reservation = BookRoom.new(reservations_params, current_user).book
    if @reservation.valid?
      render :show
    else
      redirect_to request.referer
    end
  end

  def show

  end

  private
  def load_reservations
    @reservations = reservations.find_by id: params[:id]
    return if @reservations
    flash[:error] = t(".reservations_not_found")
    redirect_to reservationss_url
  end

  def reservations_params
    params.permit(room: {},location: [:id])
  end
end
