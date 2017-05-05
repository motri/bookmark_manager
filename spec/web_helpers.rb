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
