class Product
  include Mongoid::Document
  field :brand_name, type: String
  field :product_name, type: String
  field :actual_price, type: Integer
  field :selling_price, type: Integer
  field :url, type: String
end
