class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :occupancy_limit,limit: 2
      t.integer :living_room,limit: 1
      t.integer :bed_room,limit: 1
      t.integer :bath_room,limit: 1
      t.integer :number_of_bed,limit: 1
      t.integer :quantity,limit: 1, null: false
      t.decimal :price, precision: 12, scale: 3
      t.references :bed_detail, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
