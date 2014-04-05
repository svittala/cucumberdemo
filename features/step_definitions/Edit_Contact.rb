Given(/^I am on the Contacts tab as title "(.*?)"$/) do |arg1|
#click_on('Contacts Tab')
#expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"

@driver.find_element(:link, "Contacts").click 

title = @driver.title
  if !@driver.title.include? "Contacts: Home ~ salesforce.com - Enterprise Edition" then
    raise "The title does not match with the Contacts title"
  end

end

When(/^I select the Username as "(.*?)"$/) do |arg1|
 @driver.find_element(:link, arg1).click
end

When(/^I hit the Edit button$/)do
 @driver.find_element(:name, "edit").click
end

When(/^I select salutation as "(.*?)"$/) do |arg1|
	saltn_dd = @driver.find_element(:id, "name_salutationcon2")
	sel = Selenium::WebDriver::Support::Select.new(saltn_dd)
	sel.select_by(:text, arg1)

	#(@browser.find_element(:id,'state')).select_by(:text,'Nevada')
end

When(/^I enter the title as "(.*?)"$/) do |arg1|
    @driver.find_element(:id, "con5").clear
    @driver.find_element(:id, "con5").send_keys arg1
end

When(/^I click the Save button to save the changes$/) do

#within(:xpath, ".//*[@id='topButtonRow']") do
#find_button('Save').click
#end
@driver.find_element(:name, "save").click
sleep 2

end

Then(/^I should see the updated contact details as "(.*?)"$/) do |arg1|
@driver.page_source.include? arg1
end