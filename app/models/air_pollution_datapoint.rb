class AirPollutionDatapoint < ApplicationRecord
  belongs_to :location

  enum :air_quality_index, { good: 1, fair: 2, moderate: 3, poor: 4, very_poor: 5 }

  validates :air_quality_index, presence: true
  validates :recorded_at, presence: true
end
