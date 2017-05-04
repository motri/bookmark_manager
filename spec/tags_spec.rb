
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

feature 'it filters links by tag' do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy',
    tag: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google',
    tag: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom',
    tag: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble',
    tag: [Tag.first_or_create(name: 'bubbles')])
  end
  scenario 'we only see links with bubble tag' do
     visit '/tags/bubbles'
    # expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
