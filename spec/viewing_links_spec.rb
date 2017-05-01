require_relative '../models/link'
describe Link do
  feature 'Viewing links' do
    scenario 'I can see existing links on the links page' do
      p "sajans"
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit '/links'
      expect(page.status_code).to eq 200
      within 'ul#links' do
        expect(page).to have_content('Markers Academy')
      end
    end
  end
end
