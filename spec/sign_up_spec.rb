require 'spec_helper'

feature 'it signs up a user' do
  scenario 'provides wrong password confirmation' do
    sign_up_wrong_password
    expect(page).to have_content('Your passwords do not match, try again')
  end
end
