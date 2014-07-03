Given 'I have an image on my board' do
  create_image
end

When('I drag my image to a new position') do
  find("#board .image").drag_to(find("header"))
end

Then('the image should have the updated position') do
  wait_for_ajax
  top, left = @image.top, @image.left
  expect(@image.reload.top).to be < top
  expect(@image.left).to be > left
end

When('I click on my image') do
  find("#board .image").click
end

Then('my image should be deleted') do
  expect(page).to_not have_css "#board .image"
  wait_for_ajax
  expect(Item.exists?(@image.id)).to be false
end
