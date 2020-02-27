require "selenium-webdriver"
require 'active_support'
require 'active_support/core_ext'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options
driver.get "https://note.com/papiyon0415/n/n11adbd2bbaf7"

title = driver.find_element(:class, 'o-noteContentText__title').text if driver.find_elements(:class, 'o-noteContentText__title').size > 0
title_image = driver.find_element(:class, 'o-noteEyecatch img')[:src] if driver.find_elements(:class, 'o-noteEyecatch img').size > 0
creater = driver.find_element(:class, 'o-noteContentHeader__name').text if driver.find_elements(:class, 'o-noteContentHeader__name').size > 0
creater_image = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img')[:src] if driver.find_elements(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img').size > 0
like = driver.find_element(:class, 'o-noteContentText__likeCount').text if driver.find_elements(:class, 'o-noteContentText__likeCount').size > 0
price = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').text if driver.find_elements(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').size > 0


puts title if title.present?
puts title_image if title_image.present?
puts creater if creater.present?
puts creater_image if creater_image.present?
puts like if like.present?
puts price if price.present?

driver.quit