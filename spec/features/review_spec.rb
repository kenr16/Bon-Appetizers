require 'rails_helper'

describe "the review process" do
  it "adds a new review to an existant product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'

    product = FactoryGirl.create(:product)
    visit product_path(product)
    expect(page).to have_content 'Doritos'
    click_on 'Add a review'
    fill_in 'review_author', :with => 'User'
    find('#review_rating').find(:xpath, 'option[2]').select_option
    fill_in 'review_content', :with => 'Doritos are some of the finest imported delicacies I have ever tried!'
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'

  end

  it "edits an existing review" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'

    product = FactoryGirl.create(:product)
    review = FactoryGirl.create(:review, :product_id => product.id)
    
    visit product_path(product)
    click_link 'Edit'
    fill_in 'review_author', :with => 'User'
    find('#review_rating').find(:xpath, 'option[2]').select_option
    fill_in 'review_content', :with => 'Doritos are some of the finest imported delicacies I have ever tried!'
    click_on 'Update Review'
    expect(page).to have_content 'Review successfully edited!'
  end



end
