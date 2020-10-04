class Product < ApplicationRecord
  validates_presence_of :product_name, :product_category_code
  validates_uniqueness_of :material_code
end
