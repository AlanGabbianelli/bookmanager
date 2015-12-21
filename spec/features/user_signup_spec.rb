feature 'User signup' do
  scenario 'can create an account' do
    expect { add_user }.to change{ User.count }.by(1)
    expect(page).to have_content 'Welcome username@email.com!'
  end

  scenario 'can\'t sign up with a mismatching password' do
    expect { add_user(password_confirmation: 'wrong passwords') }.not_to change{ User.count }
    expect(page).to have_content 'Cannot sign up. Mismatching passwords.'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='username@email.com']")
  end

  scenario 'can\'t sign up with no email' do
    expect { add_user(email: nil) }.not_to change{ User.count }
  end

  scenario 'can\'t sign up with invalid email' do
    expect { add_user(email: 'invalid@email' ) }.not_to change{ User.count }
  end
end
