class BookRoom
  def initialize params, user
    @params = params
    @user = user
    @room
    @total_bill = 0.0
  end

  def book
    if check_number?
      do_transaction
    else
      @reservation = Reservation.new
    end
  end

  private
  def do_transaction
    ActiveRecord::Base.transaction do
      @reservation = @user.reservations.create!
      create_reservation_details
      byebug
      total_bill(@reservation)
      @reservation.update! total_bill: @total_bill
      rescue ActiveRecord::RecordInvalid
        @room
      # rescue ActiveRecord::RecordNotFound
      #   @reservation.errors.add(:room_id, "Room or Location not found!")
      rescue ActiveRecord::StatementInvalid
        @room
    end
  end

  def integer_filter string
    Integer(string || '')
  rescue ArgumentError
    0
  end

  def create_reservation_details
    @params[:room].each do |key, value|
      integer_filter(value[:number]).times do
        @room = Location.find(@params[:location][:id]).rooms.find(key)
        @room = @room.reservation_details.create!(reservation_id: @reservation.id,
          start_date: value[:start_date], end_date: value[:end_date])
      end
    end
  end

  def total_bill reservation
    reservation.reservation_details.each do |res|
      @total_bill += res.room.price
    end
  end

  def check_number?
    @params[:room].each do |key, value|
      return true if integer_filter(value[:number]) > 0
    end
    false
  end
end
