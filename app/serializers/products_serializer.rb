class ProductsSerializer < ActiveModel::Serializer
  attributes *Product.column_names
end
