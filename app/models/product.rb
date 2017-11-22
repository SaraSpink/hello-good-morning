class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true,  numericality: true
  validates :country, :presence => true

  scope :sort_date, -> {order(created_at: :desc).limit(3)}
  scope :sort_cost, -> {order(cost: :asc).limit(5)}
  scope :sort_local, -> { Product.where(country: "United States") }
  scope :most_reviews, -> {
    left_joins(:reviews)
      .group(:id)
      .order("Count(reviews.id) DESC")
      .limit(1)
  }


end
