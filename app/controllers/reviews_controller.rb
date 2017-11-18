class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @product = @review.product

  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end
end
