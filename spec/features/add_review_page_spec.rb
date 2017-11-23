require 'rails_helper'

describe "add review page" do
  it "adds a review to a product" do
    testProduct = Product.create(:name => 'Rainbow Blanket', :cost => 12, :country => 'Mexico', :image => 'blanket.jpg')

    visit product_path(testProduct.id)


    expect(page).to have_content 'Rainbow Blanket'
  end
end
