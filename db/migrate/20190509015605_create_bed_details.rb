class CreateBedDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :bed_details do |t|
      t.string :name

      t.timestamps
    end
  end
end
