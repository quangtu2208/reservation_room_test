class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.decimal :total_bill, precision: 12, scale: 3
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
