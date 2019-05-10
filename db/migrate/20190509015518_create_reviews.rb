class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.string :comment
      t.integer :rate, null: false, limit: 1, index: true

      t.timestamps
    end
  end
end
