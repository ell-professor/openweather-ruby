class Location < ApplicationRecord
  belongs_to :state
  has_many :air_pollution_datapoints
  has_many :air_pollution_stats

  validates :name, presence: true, uniqueness: true
end
