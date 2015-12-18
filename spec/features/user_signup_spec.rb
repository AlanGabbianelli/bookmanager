feature 'User signup' do
  scenario 'a user creates an account' do
    expect { add_user }.to change{ User.count }.by(1)
    expect(page).to have_content "Welcome username@email.com!"
  end

  scenario 'user signs up with a mismatching password' do
    expect { add_user(password_confirmation: 'pwd') }.not_to change{ User.count }
    expect(page).to have_content "Cannot sign up. Mismatching passwords"
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='username@email.com']")
  end
end
