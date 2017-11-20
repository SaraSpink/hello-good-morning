class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true

  scope :sort_date, -> {order(created_at: :desc).limit(3)}
  scope :sort_cost, -> {order(cost: :asc).limit(5)}
end
