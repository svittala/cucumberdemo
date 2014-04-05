Given(/^I am on the Contacts tab with title "(.*?)"$/) do |arg1|
	#click_on('Contacts Tab')
	#expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"

	@driver.find_element(:link, "Contacts").click 

	title = @driver.title
	  if !@driver.title.include? "Contacts: Home ~ salesforce.com - Enterprise Edition" then
	    raise "The title does not match with the Contacts title"
	  end

end

When(/^I enter the First Name as "(.*?)"$/) do |arg1|
	#fill_in('name_first', :with => "George")

	@driver.find_element(:id, "name_first").clear
	@driver.find_element(:id, "name_first").send_keys 'George'

end

When(/^I enter the Last Name as "(.*?)"$/) do |arg1|
	#fill_in('name_last', :with => "Washington")

	@driver.find_element(:id, "name_last").clear
	@driver.find_element(:id, "name_last").send_keys 'Washington'

end

When(/^I enter the Account as "(.*?)"$/) do |arg1|
	#fill_in('account', :with => "CSC")

	@driver.find_element(:id, "account").clear
	@driver.find_element(:id, "account").send_keys 'CSC'
end

When(/^I enter the Phone as "(.*?)"$/) do |arg1|
	#fill_in('phone1', :with => "CSC")

	@driver.find_element(:id, "phone1").clear
	@driver.find_element(:id, "phone1").send_keys '2249993077'
end

When(/^I enter the email as "(.*?)"$/) do |arg1|
	#fill_in('email', :with => "joerge@abc123.com")

	@driver.find_element(:id, "email").clear
	@driver.find_element(:id, "email").send_keys 'joerge@abc123.com'
end

When(/^I click on Save button$/) do
	#click_on 'Save'
	@driver.find_element(:name, "save").click
end

Then(/^I should see the new contact with message "(.*?)"$/) do |arg1|
	#page.should have_content('George Washington successfully created')
	#page.should have_content('Washington, George')

	#@driver.find_element(:id=>"qcreate").text.include? "George Washington successfully created"

	@driver.page_source.include? 'George Washington successfully created'

end