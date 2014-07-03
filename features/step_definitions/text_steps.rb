When 'I drag in a new text' do
  drag_new_text
end

Then 'I should see my text'  do
  expect(page).to have_css "#board .text"
end

Given 'I have text on my board'  do
  create_text
end

When 'I double click on that text'  do
  find("#board .text").double_click
end

When 'I modify the text'  do
  find("#board .text input").set "Updated text"
end

When 'I click outside the text'  do
  find("#board").click
end

Then /^the text should (?:be|remain) updated$/  do
  expect(page).to have_css "#board .text", text: "Updated text"
  expect(@text.reload.text).to eq "Updated text"
end

When('I drag my text to a new position') do
  find("#board .text").drag_to(find("header"))
end

Then('the text should have the updated position') do
  wait_for_ajax
  top, left = @text.top, @text.left
  expect(@text.reload.top).to be < top
  expect(@text.left).to be > left
end

When('I click on my text') do
  find("#board .text").click
end

Then('my text should be deleted') do
  expect(page).to_not have_css "#board .text"
  wait_for_ajax
  expect(Item.exists?(@text.id)).to be false
end
