class CreateReservationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_details do |t|
      t.string :description
      t.datetime :start_date, index: true
      t.datetime :end_date, index: true
      t.references :reservation, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
