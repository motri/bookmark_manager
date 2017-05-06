require 'spec_helper'

feature 'it signs up a user' do
  scenario 'wrong password confirmation fails' do
    expect { sign_up_wrong_password }.not_to change(User, :count)
  end
end
