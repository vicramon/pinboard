Given('I am a user') do
  create_user
end

When('I visit the sign in page') do
  visit sign_in_path
end

When('I submit my sign in info') do
  complete_sign_in_form
  click_submit
end

Then('I should be on the boards index') do
  expect(current_path).to eq boards_path
end

Given('I am signed in') do
  create_user
  visit sign_in_path
  complete_sign_in_form
  click_submit
end

Then('I should be on the home page') do
  expect(current_path).to eq root_path
end

def complete_sign_in_form
  fill_in :email, with: @user.email
  fill_in :password, with: 'password'
end
