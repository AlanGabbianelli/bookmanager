feature 'User signup' do
  scenario 'can create an account' do
    expect { add_user }.to change{ User.count }.by(1)
    expect(page).to have_content 'Welcome username@email.com!'
  end

  scenario 'cannot sign up with mismatching passwords' do
    expect { add_user(password_confirmation: 'wrong passwords') }.not_to change{ User.count }
    expect(page).to have_content 'Cannot sign up. Mismatching passwords.'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='username@email.com']")
  end

  xscenario 'cannot sign up with no email' do
    expect { add_user(email: nil) }.not_to change{ User.count }
    expect(page).to have_content 'Cannot sign up. Email required.'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='username@email.com']")
  end

  xscenario 'cannot sign up with an invalid email' do
    expect { add_user(email: 'invalid@email' ) }.not_to change{ User.count }
    expect(page).to have_content 'Cannot sign up. Email must be valid.'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='username@email.com']")
  end

  xscenario 'cannot sign up with an already registered email' do
    add_user
    expect { add_user }.not_to change{ User.count }
    expect(page).to have_content 'Cannot sign up. Email already registered.'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='username@email.com']")
  end
end
