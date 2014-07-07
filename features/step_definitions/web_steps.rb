When(/^I follow "(.*?)"$/) do |text|
  click_link_or_button text
end

When('I refresh the page') do
  wait_for_ajax
  visit current_path
end

When('I visit my board') do
  visit board_path @board
end
