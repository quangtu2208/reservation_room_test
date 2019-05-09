class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :user, foreign_key: true
      t.references :location_type, foreign_key: true
      t.string :name, index: {unique: true}
      t.string :location
      t.string :national, index: true
      t.string :zip_code
      t.string :description
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
