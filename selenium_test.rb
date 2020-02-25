require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options
driver.get "https://note.com/cohki0305/n/ne21cd96137ec?creator_urlname=cohki0305"

title = driver.find_element(:class, 'o-noteContentText__title').text
title_image = driver.find_element(:class, 'o-noteEyecatch img')[:src]
creater = driver.find_element(:class, 'o-noteContentHeader__name').text
creater_image = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img')[:src]
like = driver.find_element(:class, 'o-noteContentText__likeCount').text
price = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').text

puts title
puts title_image
puts creater
puts creater_image
puts like
puts price

driver.quit