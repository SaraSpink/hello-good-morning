# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Hipster.word,
  image: Faker::LoremPixel.image("200x200", false, 'animals'),
  country: Faker::Address.country,
  cost: Faker::Number.decimal(2,2)
  )

  5.times do |index|
    review = Review.create!(author: Faker::TwinPeaks.character,
    content_body: Faker::Lorem.sentence(15, false, 0),
    product_id: product.id,
    rating: Faker::Number.between(1,5))
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
