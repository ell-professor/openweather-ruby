# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding locations... ."
location_seed_file = Rails.root.join('db', 'seeds', 'locations.yml')
locations = YAML::load_file(location_seed_file)

locations.each do |location|
  Importers::Location.new(location).call
  puts "Created #{location}"
end

puts "Locations created successfully... ."
