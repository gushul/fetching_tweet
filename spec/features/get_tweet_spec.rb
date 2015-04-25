require "rails_helper"

feature 'Get tweets' do

  before(:each) do
    visit root_path
  ***REMOVED***

  scenario 'Get 3 tweets when set nickname' do
    fill_in 'nickname', with: 'newrelic'
    click_button 'GET'

    expect(page).to have_content 'newrelic'
  ***REMOVED***

  scenario 'Error without nickname' do
    fill_in 'nickname', with: ''
    click_button 'GET'

    expect(page).to have_content "Get tweet"
    expect(page).to have_text 'Please set twitter name'
  ***REMOVED***

***REMOVED***
