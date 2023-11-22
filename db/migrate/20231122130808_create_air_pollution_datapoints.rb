class CreateAirPollutionDatapoints < ActiveRecord::Migration[7.0]
  def change
    create_table :air_pollution_datapoints do |t|
      t.integer :air_quality_index, null: false, limit: 2
      t.float :co
      t.float :no
      t.float :no2
      t.float :o3
      t.float :so2
      t.float :pm2_5
      t.float :pm10
      t.float :nh3
      t.datetime :recorded_at, null: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
