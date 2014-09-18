Given(/^I am not logged in$/) do
  visit users_logout_path
end

When(/^I sign up with valid user information$/) do
  visit "/auth/facebook"
end

Then(/^I should see "(.*?)" message$/) do |msg|
  expect(page).to have_content msg
end

Given(/^I am logged in$/) do
  visit "/auth/facebook"
end
