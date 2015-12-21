# As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager

feature 'Adding multiple tags' do
  scenario 'can add multiple tags to a new link' do
    create_link_BBC_3_tags
    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles', 'news', 'media')
  end
end
