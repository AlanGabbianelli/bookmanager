# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'Filtering tags' do
  scenario 'can filter links by tag' do
    create_link_BBC
    visit '/tags/bubbles'
    expect(page).to have_content('BBC')
  end
end
