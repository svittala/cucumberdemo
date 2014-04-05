require 'selenium-webdriver'
#require 'spreadsheet'
#require 'spreadsheet/excel/reader'
driver = Selenium::WebDriver.for(:firefox)

Before do
 @driver = driver 
end

