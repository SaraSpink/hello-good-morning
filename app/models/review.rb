class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :presence => true
  validates :content_body, :presence => true, :length => { :minimum => 50, :maximum => 250 }
  validates :rating,  numericality: true, :presence => true, :inclusion => 1..5 
  validates :product_id, :presence => true
end
