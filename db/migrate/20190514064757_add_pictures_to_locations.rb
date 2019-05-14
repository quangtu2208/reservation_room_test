class AddPicturesToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :pictures, :json
  end
end
