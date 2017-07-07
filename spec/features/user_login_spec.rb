require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    expect(page).to have_content 'user@email.com'
  end

  it "fails when no information is entered" do
    visit products_path
    click_link 'Sign up'
    click_on 'Sign Up'
    expect(page).to have_content 'There was a problem signing up.'
  end

  it "adds a new user then logs out" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    click_link 'Sign out'
    expect(page).to have_content "You've signed out."

  end

  it "adds a new user then logs out only to log back in again" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_name', :with => 'User'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'helloyou'
    fill_in 'user_password_confirmation', :with => 'helloyou'
    click_on 'Sign Up'
    click_link 'Sign out'
    click_on 'Sign in'
    fill_in 'email', :with => 'user@email.com'
    fill_in 'password', :with => 'helloyou'
    click_on 'Log in'
    expect(page).to have_content "user@email.com"
  end

end
