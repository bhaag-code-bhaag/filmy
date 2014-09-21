Given(/^I am not logged in$/) do
  visit users_logout_path
end

When(/^I sign up with valid user information$/) do
  visit "/auth/facebook"
end

Then(/^I should see a successful registration message$/) do
  expect(page).to have_content("Successfully Logged in")
end
