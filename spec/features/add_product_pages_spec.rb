require 'rails_helper'

describe "add product page" do
  it "adds a new product" do
    visit products_path
    click_link 'Add a Product'
    fill_in 'Name', :with => 'Silk Kite'
    fill_in 'Cost', :with => 30
    fill_in 'Country', :with => 'Mexico'
    fill_in 'Image', :with => 'kite.jpg'
    click_on 'Create Product'
    expect(page).to have_content 'Silk Kite'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
