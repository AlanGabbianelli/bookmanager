feature 'User signin' do
  scenario 'can sign in with correct credentials' do
    user_signup
    user_signin(email: 'username@email.com', password: 'password')
    expect(page).to have_content "Welcome username@email.com!"
  end
end
