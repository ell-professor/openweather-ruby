FactoryBot.define do
  factory :air_pollution_stat do
    average_aqi { 1 }
    number_of_datapoints { 2 }
    month { Date.today.month }
    year { Date.today.year }
    association :location
  end
end
