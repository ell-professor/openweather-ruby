class AirPollutionStat < ApplicationRecord
  belongs_to :location

  validates :average_aqi, presence: true
  validates :number_of_datapoints, presence: true
  validates :month, presence: true
  validates :year, presence: true
  validates :location, uniqueness: { scope: [:month, :year] }
end
