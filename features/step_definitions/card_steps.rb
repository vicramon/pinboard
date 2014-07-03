Given('I have a board') do
  create_board
end

When('I drag in a new card') do
  drag_new_card
end

Then('I should see my card') do
  expect(page).to have_css "#board .card"
end

Given('I have a card on my board') do
  create_card
end

When('I double click on that card') do
  card = find("section#board .card")
  card.double_click
end

When('I modify the text on the card') do
  find("section#board .card textarea").set "New card text"
end

When('I click outside the card') do
  find("section#board").click
end

Then('the card should have the new text') do
  expect(page).to have_css "section#board .card", text: "New card text"
  expect(@card.reload.text).to eq "New card text"
end

When('I drag my card to a new position') do
  find("#board .card_container").drag_to(find("header"))
end

Then('the card should have the updated position') do
  wait_for_ajax
  top, left = @card.top, @card.left
  expect(@card.reload.top).to be < top
  expect(@card.left).to be > left
end

When('I click on my card') do
  find("#board .card").click
end

When('I press the backspace key') do
  find("#board").native.send_keys(:backspace)
end

Then('my card should be deleted') do
  expect(page).to_not have_css "#board .card"
  wait_for_ajax
  expect(Item.exists?(@card.id)).to be false
end
