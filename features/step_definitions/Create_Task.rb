Given(/^I am on Contacts tab title "(.*?)"$/) do |arg1|
#@browser.find_element(:link, "Contacts").click
	@driver.find_element(:link, "Contacts").click
 	sleep 2
end

When(/^I select Contact "(.*?)"$/) do |arg1|
	@driver.find_element(:link, arg1).click
end

When(/^I add a "(.*?)"$/) do |arg1|
	@driver.find_element(:name, "task").click
 	sleep 2
end

When(/^I enter the details in the page as "(.*?)"$/) do |arg1|
	@driver.find_element(:id, "tsk5").clear
	@driver.find_element(:id, "tsk5").send_keys 'Create Salesforce Project Chargecode'

	@driver.find_element(:id, "tsk4").clear
	@driver.find_element(:id, "tsk4").send_keys "5/3/2014"

	@driver.find_element(:xpath, ".//*[@id='whobtn']/img").click

	#Get the main window handle
	main = @driver.window_handles.first

	#Get the popup window handle
	popup = @driver.window_handles.last

	#Then switch control between the windows
    @driver.switch_to.window(popup)
	sleep 2

	@driver.switch_to.frame "searchFrame"
	    @driver.find_element(:id, "lksrch").clear
	    @driver.find_element(:id, "lksrch").send_keys "rama"
	    @driver.find_element(:name, "go").click
	sleep 2

	@driver.switch_to.default_content

	@driver.switch_to.frame "resultsFrame"
	@driver.find_element(:link, "Rama rao Krishna").click
	sleep 3
	@driver.switch_to.window(main)
end

When(/^I click Save button and verify the task creation$/) do
	@driver.find_element(:name, "save").click
	sleep 3
	@driver.find_element(:link, "Contacts").click
	@driver.find_element(:link, "Krishna, Rama rao").click

	@driver.page_source.include? "Create Salesforce Project Chargecode"

	@driver.save_screenshot('Task Creation.png')

	@driver.close()
	@driver.quit()
end
