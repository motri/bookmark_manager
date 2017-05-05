require 'spec_helper'
feature 'it adds tags links' do
  scenario 'we add a tag to a submitted link' do
    fills_in_youtube
    link = Link.first
    expect(link.tag.map(&:name)).to include('videos')
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
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end

feature 'it add multiple tags' do
  scenario 'we add three tags to link and they are present' do
    fills_in_google
    fills_in_youtube
    visit '/tags/snoops'
    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).to_not have_content('Youtube')
    end
  end
end
