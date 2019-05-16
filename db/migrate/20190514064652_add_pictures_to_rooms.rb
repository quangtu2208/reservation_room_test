class AddPicturesToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :pictures, :json
  end
end
