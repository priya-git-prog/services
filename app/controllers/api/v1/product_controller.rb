class Api::V1::ProductController < Api::V1::ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    products = Product.where(status: true)
    render json: products
  end
end
