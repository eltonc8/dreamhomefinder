# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_data = IO.readlines("db/listings.csv")
data_header = seed_data.shift.split(/[\n,]/)
data_header[0] = "identity" if data_header[0] == "id"

seed_data.each do |line|
  data = line.split(/[\n,]/)
  attributes = {}
  data_header.length.times do |idx|
    attributes[ data_header[idx] ] = data[idx]
  end
  Feature.create!( attributes )
end
