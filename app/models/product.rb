class Product < ActiveRecord::Base
  has_many :categories_products
  has_many :materials_products
  has_many :categories, :through => :categories_products
  has_many :materials, :through => :materials_products
end