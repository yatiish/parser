class ProductsController < ApplicationController
  def get_url
  end

  def parse_data
    data = Net::HTTP.get(URI.parse(params[:url]))
    product_name = data.scan(/itemprop="name">(.*)<\/span>/).last
    if product_name.present?
      brand_name = data.match(/itemprop="brand">(.*)<\/span>/)[1]
      selling_price = (data.match(/"striked-price(.*)<\/span>/)[1]).gsub(/.*Rs./,"")
      actual_price = (data.match(/<span itemprop="price"(.*)<\/span>/)[1]).match(/>(.*)<\/span>/)[1]
      @product = Product.create(product_name: product_name.first,
        brand_name: brand_name, selling_price: selling_price,
        actual_price: actual_price, url: params[:url])
    end
  end

  def index
    @products = Product.all
  end
end
