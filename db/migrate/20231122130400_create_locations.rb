class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false, unique: true
      t.st_point :latlon, geographic: true
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
