class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true,  numericality: true
  validates :country, :presence => true

  scope :sort_date, -> {order(created_at: :desc).limit(3)}
  scope :sort_cost, -> {order(cost: :asc).limit(5)}
  scope :sort_local, -> { Product.where(country: "United States") }
  scope :most_reviews, -> {(
    select("products.id, products.name, products.image, products.cost, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1).first
  )}


end
