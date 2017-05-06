require 'spec_helper'

feature 'it signs into users link profile' do
  scenario 'we sign in and takes us to link list' do
    sign_up
    expect(page).to have_content('Bookmark Manager Welcome,
     unaimotriko@electromail.org! Add links Go to links')
  end
end

feature 'it signs into users link profile' do
  scenario 'checks user count increases by one' do
    expect { sign_up }.to change { User.all.count }.by 1
  end
end
