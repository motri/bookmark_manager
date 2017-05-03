
feature 'it adds tags links' do
  scenario 'we add a tag to a submitted link' do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'google.com'
    fill_in :tag, with: 'search engine'
    click_on 'Create link'
    link = Link.first
    expect(link.tag.map(&:name)).to include('search engine')
  end
end
