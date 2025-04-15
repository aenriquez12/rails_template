Given('I am on the login page') do
  visit new_session_path
end

When('I enter my username {string}') do |email|
  fill_in 'email_address', with: email
end

When('I enter my password {string}') do |password|
  fill_in 'password', with: password
end

When('I click the login button') do
  click_button 'Sign In'
end

Then('I should be redirected to my dashboard') do
  expect(current_path).to eq(dashboard_path)
end

Then('I should see a welcome message {string}') do |message|
  expect(page).to have_content(message)
end

When('I enter an incorrect password {string}') do |password|
  fill_in 'password', with: password
  click_button 'Sign In'
end

Then('I should see an error message {string}') do |message|
  expect(page).to have_content(message)
end

Given('I am logged in') do
  visit new_session_path
  fill_in 'email_address', with: 'user@example.com'
  fill_in 'password', with: 'securepassword'
  click_button 'Sign In'
end

When('I click the logout button') do 
  click_link "Logout"
end

Then('I should be redirected to the homepage') do
  expect(current_path).to eq(root_path)
end

Then('I should see a message {string}') do |message|
  expect(page).to have_content(message)
end
