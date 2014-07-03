Given('I have a board') do
  create_board
end

Given('I visit my board') do
  visit_board
end

When('I drag in a new card') do
  drag_new_card
end

Then('I should see my card') do
  expect(page).to have_css "#board .card"
end
