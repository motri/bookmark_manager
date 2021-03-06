def fills_in_youtube
  visit '/links/new'
  fill_in :title, with: 'Youtube'
  fill_in :url, with: 'youtube.com'
  fill_in :tag, with: 'videos'
  click_on 'Create link'
end

def fills_in_google
  visit '/links/new'
  fill_in :title, with: 'Google'
  fill_in :url, with: 'google.com'
  fill_in :tag, with: 'search engine; overlords; snoops'
  click_on 'Create link'
end

def log_in
  visit '/'
  click_link 'Sign up'
  fill_in :user, with: 'unaimotriko@electromail.org'
  fill_in :password, with: 'doughnut'
  click_on 'Submit'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in :user, with: 'unaimotriko@electromail.org'
  fill_in :password, with: 'doughnut'
  fill_in :password_confirmation, with: 'doughnut'
  click_on 'Submit'
end

def sign_up_wrong_password
  visit '/'
  click_link 'Sign up'
  fill_in :user, with: 'unaimotriko@electromail.org'
  fill_in :password, with: 'doughnut'
  fill_in :password_confirmation, with: 'pretzel'
  click_on 'Submit'
end
