require 'rails_helper'

describe "add review page" do
  it "adds a review to a product" do
    testProduct = Product.create(:name => 'Rainbow Blanket', :cost => 12, :country => 'Mexico', :image => 'blanket.jpg')

    visit new_product_review_path(testProduct.id)

    fill_in 'Author', :with => 'Laura Palmer'
    fill_in 'Content body', :with => 'A very nice description of the rainbow blanket that is 50 characters long and describes the product in detail'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'

    expect(page).to have_content 'Laura Palmer'
  end
end
