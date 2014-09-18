When(/^I visit movie creation page$/) do
  visit new_movie_path
end

When(/^fill in movie details$/) do
  fill_in "Name", with: "Power"
  fill_in "Description", with: power_movie_description
  fill_in "Tag line", with: "All mass, no class"
  # attach_file('Image', '/home/vamsi/Projects/filmy/spec/fixtures/images/powers.jpg')
  click_button "Save"
end

When(/^fill in invalid movie details$/) do
  click_button "Save"
end

def power_movie_description
  "ACP Baldev Sahay (Ravi Teja) is a corrupt cop in Kolkata.
  He dies in a fierce fight. Tirupathi (Ravi Teja) is a cop wannabe in Hyderabad.
  The home minister of Kolkata recruits Tirupathi to play as ACP Baldev as he looks like him.
  Rest of the story is all about why ACP Baldev became a corrupt cop and how Thirupathi
  executed the the unfinished mission of Baldev."
end
