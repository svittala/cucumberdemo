Given(/^I am on the Contacts tab title "(.*?)"$/) do |arg1|
#click_on('Contacts Tab')
#expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"
sleep 2
@driver.find_element(:link, "Contacts").click 

title = @driver.title
  if !@driver.title.include? "Contacts: Home ~ salesforce.com - Enterprise Edition" then
    raise "The title does not match with the Contacts title"
  end

end

When(/^I select the Username "(.*?)"$/) do |arg1|
#click_link('Washington, George')

@driver.find_element(:link, "Washington, George").click
end

When(/^I hit the Delete button$/)do

#within(:xpath, ".//*[@id='topButtonRow']") do
#find_button('Delete').click
#end

@driver.find_element(:name, "del").click
end

When(/^I select OK from the confirmation popup$/) do
  #page.driver.browser.switch_to.alert.accept
@driver.switch_to.alert.accept
end

Then(/^I should not see the respective contact in the page$/) do
#page.should have_no_content('Washington, George')

  if @driver.page_source.include? "Washington, George" then
    raise "Failed to delete the contact"
  end

end