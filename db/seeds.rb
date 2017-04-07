# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# residents = CSV.open("Workbook1.csv", :headers => true)
# residents_data = CSV.parse(residents)
# #arr_of_arrs = CSV.parse("Workbook1.csv")
# p residents_data[0]

# residents_data.each do |row|
#     p row
#     #data = row.split(',')
#     #row.fields.to_csv( options )
    
#     data = row.split(',')
#     Residents.create(data[0], data[1], data[2], data[3])
# end

# p Residents.column_names

# csv_data = File.read('Workbook1.csv')
# csv = CSV.parse(csv_data, :headers => true)
# csv.each do |row|
#   Residents.create!(row.to_hash)
# end

Frizbee.create!(:name => 'Yetter')
