require "rails_helper"

feature 'Post tweets' do

  before(:each) do
    visit root_path
  end

  scenario 'Post tweet' do
    fill_in 'tweet_text', with: 'new tweet'
    click_button 'POST'

    expect(page).to have_content 'Great, user gushulo successful tweet'
  end

  scenario 'Error post tweetw without text' do
    fill_in 'tweet_text', with: ''
    click_button 'POST'

    expect(page).to have_text 'Please write tweet text'
  end

end
