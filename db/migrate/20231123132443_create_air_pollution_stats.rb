class CreateAirPollutionStats < ActiveRecord::Migration[7.0]
  def change
    create_table :air_pollution_stats do |t|
      t.float :average_aqi, null: false
      t.integer :number_of_datapoints, null: false
      t.integer :month, null: false, limit: 2
      t.integer :year, null: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end

    add_index :air_pollution_stats, [:location_id, :month, :year], unique: true
  end
end
