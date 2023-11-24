FactoryBot.define do
  factory :air_pollution_datapoint do
    air_quality_index { 1 }
    recorded_at { Time.now }
    association :location
  end
end
