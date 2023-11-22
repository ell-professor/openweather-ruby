class Location < ApplicationRecord
  belongs_to :state

  validates :name, presence: true, uniqueness: true
end
