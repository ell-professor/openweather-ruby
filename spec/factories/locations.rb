FactoryBot.define do
  factory :location do
    name { 'Delhi'}
    latlon { RGeo::Geographic.spherical_factory(srid: 4326).point(50, 50) }
    association :state
  end
end
