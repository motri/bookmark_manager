require 'spec_helper'

feature 'it signs into users link profile' do
  scenario 'we sign in and takes us to link list' do
    log_in
    expect(page).to have_content('Welcome unaimotriko@electromail.org!')
    expect { User.create }.to change(User.id.count).by 1
  end
end
