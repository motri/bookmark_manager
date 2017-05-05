feature 'it signs into users link profile' do
  scenario 'we sign in and takes us to link list' do
    visit '/home'
    fill_in :user, with: 'unaimotriko@electromail.org'
    fill_in :password, with: 'doughnut'
    click_on 'Log in'
    expect(page).to have_content('Welcome back unaimotriko@electromail.org!')
    expect { User.create }.to change(User.id).by 1
  end
end
