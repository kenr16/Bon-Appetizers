require 'rails_helper'

describe "the make a user an admin process" do
  it "makes a newly created user an admin" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'
    visit "users/"
    click_on 'User'
    find("option[value='true']").click
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Edit User'
    expect(page).to have_content 'User successfully edited!'
  end

  it "checks to see if the user can see a link only availible to admins" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    page.should have_no_content('New Product')
  end

  it "checks to see if an admin can see newly created links" do
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
    expect(page).to have_content 'New Product'
    # page.find_link('New Product').visible?
  end




end
