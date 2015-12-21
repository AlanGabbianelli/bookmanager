# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'Creating links' do
  scenario 'can add links on the bookmark manager' do
    visit '/links'
    click_link 'Add Bookmark'
    fill_in 'Name', with: 'BBC'
    fill_in 'url', with: 'http://bbc.co.uk'
    click_button 'Add'
    expect(page).to have_content('BBC')
  end
end
