Given(/^I am on the Salesforce home page$/) do
@driver.get('https://login.salesforce.com/')
# @driver.manage.window.maximize

end

When(/^I use the "(.*?)" as "(.*?)"$/) do |arg1, arg2|
  @driver.find_element(:id, arg1).clear
  @driver.find_element(:id, arg1).send_keys arg2
end
When(/^I give the "(.*?)" as "(.*?)"$/) do |arg1, arg2|
  @driver.find_element(:id, arg1).clear
  @driver.find_element(:id, arg1).send_keys arg2
end

When(/^I click on "(.*?)" button$/) do |arg1|
  @driver.find_element(:id, arg1).click  
end

When(/^I am on home page with title "(.*?)"$/) do |arg1|
#puts page.title
#expect(page).to have_title "salesforce.com - Enterprise Edition"

if !@driver.title.include? arg1 then
    raise "The title does not match with the Homepage title"
end
end