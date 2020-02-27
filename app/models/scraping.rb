class Scraping

  require "selenium-webdriver"
  require 'active_support'
  require 'active_support/core_ext'

  def self.get_products(note)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.get(note.url)
    
    title = driver.find_element(:class, 'o-noteContentText__title').text if driver.find_elements(:class, 'o-noteContentText__title').size > 0
    title_image = driver.find_element(:class, 'o-noteEyecatch img')[:src] if driver.find_elements(:class, 'o-noteEyecatch img').size > 0
    creater = driver.find_element(:class, 'o-noteContentHeader__name').text if driver.find_elements(:class, 'o-noteContentHeader__name').size > 0
    creater_image = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img')[:src] if driver.find_elements(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img').size > 0
    like = driver.find_element(:class, 'o-noteContentText__likeCount').text if driver.find_elements(:class, 'o-noteContentText__likeCount').size > 0
    price = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').text if driver.find_elements(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').size > 0

    note.title = title if title.present?
    note.title_image = title_image if title_image.present?
    note.creater = creater if creater.present?
    note.creater_image = creater_image if creater_image.present?
    note.like = like if like.present?
    note.price = price if price.present?
    note.save
    
    driver.quit
  end
  
end