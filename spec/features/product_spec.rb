require 'rails_helper'

describe "the product process" do
  it "creates a new product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'

    visit "/users"
    click_link 'User'
    find('#user_admin').find(:xpath, 'option[1]').select_option
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Edit User'

    visit products_path
    click_link 'New Product'
    fill_in 'product_name', :with => 'Peaches'
    fill_in 'product_price', :with => 1.95
    fill_in 'product_category', :with => 'Fruit'
    fill_in 'product_description', :with => 'Millions of peaches, peaches for me!  Millions of peaches, peaches for free.'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
  end

  it "edits an existing product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'

    visit "/users"
    click_link 'User'
    find('#user_admin').find(:xpath, 'option[1]').select_option
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Edit User'

    product = FactoryGirl.create(:product)
    visit product_path(product)

    click_on 'Edit Product'
    fill_in 'product_price', :with => 2.99
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully edited!'
  end

  it "fails to edits an existing product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'

    visit "/users"
    click_link 'User'
    find('#user_admin').find(:xpath, 'option[1]').select_option
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Edit User'

    product = FactoryGirl.create(:product)
    visit product_path(product)

    click_on 'Edit Product'
    fill_in 'product_name', :with => ''
    fill_in 'product_category', :with => ''
    fill_in 'product_description', :with => ''
    click_on 'Update Product'
    expect(page).to have_content 'Product edit failed!'
  end



  it "deletes an existing product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'

    visit "/users"
    click_link 'User'
    find('#user_admin').find(:xpath, 'option[1]').select_option
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Edit User'

    product = FactoryGirl.create(:product)
    visit product_path(product)

    click_on 'Delete Product'
    expect(page).to have_content 'Product successfully deleted!'
  end




end
