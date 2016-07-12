# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

#
# Category.create(name: "Брус")
# Category.create(name: "Блок-хаус")
#
# Material.create(name: "Сосна")
# Material.create(name: "Лиственница")
# Material.create(name: "Кедр")
#
#
# cat = Category.where(name: "Брус")
# mat = Material.where(name: "Сосна")
# Product.create(category: cat, material: mat, size: '1x1x1', sort: 1, price: 100, unit: 'см')
#
#
# Category.create(:name => "Cat1")
# Category.first.products.create(:name => "Prod1")
# Product.first.categories.create(:name => "Cat2")

require 'csv'

CSV.foreach(Rails.root.join('db', 'seeds_data', 'products.tsv'), :col_sep => "\t",  :headers => true,
          :encoding => 'utf-8').each do |row|
  Product.find_or_create_by(size: row[2], sort: row[3],
                            price: row[4], unit: row[5], img: row[6])
end
puts "There are now #{Product.count} rows in the transactions table"