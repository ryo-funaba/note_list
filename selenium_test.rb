require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options
driver.get "https://note.com/cohki0305/n/ne21cd96137ec?creator_urlname=cohki0305"

title = driver.find_element(:class, '.o-noteContentText__title').text
title_image = driver.find_element(:class, '.o-noteEyecatch img')[:src]
creater = driver.find_element(:class, '.o-noteContentHeader__name').text
# creater_image = driver.find_element(:class, '')

puts title
puts title_image
puts creater

driver.quit