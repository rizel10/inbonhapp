class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :when
      t.string :address
      # Decimals
      t.decimal :lat, null: true, precision: 10, scale: 6
      t.decimal :lng, null: true, precision: 10, scale: 6

      t.timestamps
    end
  end
end
