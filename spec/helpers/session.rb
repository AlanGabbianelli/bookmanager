module SessionHelpers
  
  def create_link_BBC
    visit 'links/new'
    fill_in 'Name', with: 'BBC'
    fill_in 'url', with: 'http://bbc.co.uk'
    fill_in 'tags', with: 'bubbles'
    click_button 'Add'
  end

  def create_link_BBC_3_tags
    visit 'links/new'
    fill_in 'Name', with: 'BBC'
    fill_in 'url', with: 'http://bbc.co.uk'
    fill_in 'tags', with: 'bubbles, news, media'
    click_button 'Add'
  end

  def user_signup(email: 'username@email.com', password: 'password', password_confirmation: 'password')
    visit 'users/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Sign up!'
  end

  def user_signin(email:, password:)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign in'
  end

end
