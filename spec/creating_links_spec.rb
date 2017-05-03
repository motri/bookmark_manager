
feature 'Creates new links' do
  scenario 'we fill in form with url' do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'google.com'
    click_on 'Create link'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
