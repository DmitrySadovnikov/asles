# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

require 'csv'

CSV.foreach(Rails.root.join('db', 'seeds_data', 'products.tsv'), :col_sep => "\t",  :headers => true,
          :encoding => 'utf-8').each do |row|
  Product.find_or_create_by(name: row[0], material: row[1], type_wood: row[2], processing: row[3], size: row[4], sort: row[5],
                            price: row[6], unit: row[7], img: row[8])
end
puts "There are now #{Product.count} rows in the transactions table"