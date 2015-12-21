# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature 'Adding a tag' do
  scenario 'can add a tag to a new link' do
    create_link_BBC
    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles')
  end
end
