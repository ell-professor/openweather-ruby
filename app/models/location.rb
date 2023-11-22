class Location < ApplicationRecord
  belongs_to :state
  has_many :air_pollution_datapoints

  validates :name, presence: true, uniqueness: true
end
