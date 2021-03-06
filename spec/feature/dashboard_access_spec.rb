require 'rails_helper'

RSpec.feature 'User Dashboards' do
  let(:user) do
    FactoryGirl.create(:john_doe)
  end

  before do
    visit '/'
    click_link 'Log In'
  end

  scenario 'If User is Retailer' do
    user.active!
    user.retailer!
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Log In'

    expect(page.current_url).to eq retailer_dashboard_url
    expect(page).to have_content 'Login successful'
    expect(page).to have_link 'Stations'
    expect(page).to have_link 'Suppliers'
    #expect(page).to have_link 'Orders'
    expect(page).to have_link 'Fuel Price'
    expect(page).to have_link 'Documents'
    expect(page).to have_link 'Reports'

    visit '/admin'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq retailer_dashboard_url

    visit '/supplier'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq retailer_dashboard_url

    visit '/trucking'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq retailer_dashboard_url
  end

  scenario 'If User is Supplier' do
    user.active!
    user.supplier!
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Log In'

    expect(page.current_url).to eq supplier_dashboard_url
    expect(page).to have_content 'Login successful'
    expect(page).to have_link 'Fuel Price'
    expect(page).to have_link 'Retailers'
    #expect(page).to have_link 'Orders'
    expect(page).to have_link 'Documents'
    expect(page).to have_link 'Reports'

    visit '/admin'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq supplier_dashboard_url

    visit '/retailer'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq supplier_dashboard_url

    visit '/trucking'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq supplier_dashboard_url
  end

  scenario 'If User is Admin' do
    user.active!
    user.admin!
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Log In'

    expect(page.current_url).to eq admin_dashboard_url
    expect(page).to have_content 'Login successful'
    expect(page).to have_link 'Users'
    expect(page).to have_link 'Retailers'
    expect(page).to have_link 'Suppliers'
    expect(page).to have_link 'Trucking'
    expect(page).to have_link 'Orders'
    expect(page).to have_link 'Documents'
    expect(page).to have_link 'Fuel Price'
    expect(page).to have_link 'Reports'
    expect(page).to have_link 'Opus Price'

    visit '/supplier'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq admin_dashboard_url

    visit '/retailer'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq admin_dashboard_url

    visit '/trucking'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq admin_dashboard_url
  end

  scenario 'If User is Trucking' do
    user.active!
    user.trucking!
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Log In'

    expect(page.current_url).to eq trucking_dashboard_url
    expect(page).to have_content 'Login successful'
    expect(page).to have_link 'Retailers'
    expect(page).to have_link 'Suppliers'
    expect(page).to have_link 'Orders'
    expect(page).to have_link 'Documents'
    expect(page).to have_link 'Reports'
    expect(page).to have_link 'Drivers'

    visit '/supplier'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq trucking_dashboard_url

    visit '/retailer'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq trucking_dashboard_url

    visit '/admin'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq trucking_dashboard_url
  end
end
