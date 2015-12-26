feature 'User signout' do
  scenario 'can sign out' do
    user_signup
    user_signin(email: 'username@email.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome username@email.com!'
  end
end
