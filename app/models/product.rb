class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true,  numericality: true
  # validates :country, :presence => true

  scope :sort_date, -> {order(created_at: :desc).limit(3)}
  scope :sort_cost, -> {order(cost: :asc).limit(5)}
end
