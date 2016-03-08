require "rails_helper"

RSpec.feature "Users can create Accounts" do
  before do
    visit "/"
    click_link "Sign up"
  end

  scenario "With valid attributes" do
    fill_in "First Name", with: "Suyesh"
    fill_in "Last Name", with: "Bhandari"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Business Name", with: "Acme Retail Inc"
    fill_in "Phone Number", with: "3472817892"
    fill_in "Cell Number", with: "3472817892"
    fill_in "Tax ID", with: "1234567890"
    fill_in "SSN #", with: "2222"
    fill_in "Street Address", with: "3416 99 st"
    fill_in "Zip Code", with: "11234"
    fill_in "City", with: "New York"
    select('New York', :from => 'State')
    select("Retail", :from => "Business Type")
    fill_in "Years in Business", with: "5"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully. It might take upto 24 hours for Petrohub to approve your account. If you have any Questions, please email sales@petrohub.org")
    expect(page.current_url).to eq root_url
  end


end
