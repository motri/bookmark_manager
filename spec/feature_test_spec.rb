feature 'it signs into users link profile' do
  scenario 'we sign in and takes us to link list' do
    visit '/'
    fill_in :user, with: 'unaimotriko@electromail.org'
    fill_in :password, with: 'doughnut'
    click_on 'Log in'
    expect(page).to have_content('Welcome unaimotriko@electromail.org!')
    expect { User.create }.to change(User.id.count).by 1
  end
end
