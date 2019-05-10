class CreateRoomsServices < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_services do |t|
      t.references :room, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
