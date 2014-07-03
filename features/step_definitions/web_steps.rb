When(/^I follow "(.*?)"$/) do |text|
  click_link_or_button text
end

When('I refresh the page') do
  visit current_path
end
