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

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review Successfully added"
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end
