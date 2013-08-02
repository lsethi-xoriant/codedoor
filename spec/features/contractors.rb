require 'spec_helper'

feature 'Logging in' do
  scenario 'Contractor sign up and editing' do
    github_login
    click_link 'Create contractor account'
    fill_in 'Title', with: 'Test Title'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Rate', with: 100
    choose('full-time')
    choose('contractor_onsite_status_onsite')
    check('contractor_client_can_visit')
    click_button 'Add Info'

    expect(page).to have_content 'Your profile has been created.'
    expect(page).to have_content 'Test User'
    expect(page).to have_content 'Test Title'
    expect(page).to have_content '$900 per day'
    expect(page).to have_content 'Full Time'
    expect(page).to have_content 'Work can be done at a client\'s office if it is nearby.'
    expect(page).to have_content 'Clients can visit the contractor\'s office.'

    click_link 'Edit Info'
    fill_in 'Rate', with: 50
    click_button 'Edit Info'
    expect(page).to have_content 'Your profile has been updated.'
    expect(page).to have_content '$450 per day'
  end
end