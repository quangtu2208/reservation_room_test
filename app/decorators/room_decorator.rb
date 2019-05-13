module RoomDecorator
  include ActionView::Helpers

  def select_option
    Location.pluck :name
  end
end
