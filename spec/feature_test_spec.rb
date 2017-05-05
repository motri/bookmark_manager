require 'spec_helper'

feature 'it signs into users link profile' do
  scenario 'we sign in and takes us to link list' do
    log_in
    p User.first
    p User.first.hash_password

    expect(page).to have_content('Welcome unaimotriko@electromail.org!')
  end
end

feature 'it signs into users link profile' do
  scenario 'checks user count increases by one' do
    expect { log_in }.to change { User.all.count }.by 1
  end
end
