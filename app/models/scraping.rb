class Scraping

  require "selenium-webdriver"
  require 'active_support'
  require 'active_support/core_ext'

  def self.get_products(url)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.get(url)
    
    title = driver.find_element(:class, 'o-noteContentText__title').text if driver.find_elements(:class, 'o-noteContentText__title').size > 0
    title_image = driver.find_element(:class, 'o-noteEyecatch img')[:src] if driver.find_elements(:class, 'o-noteEyecatch img').size > 0
    creater = driver.find_element(:class, 'o-noteContentHeader__name').text if driver.find_elements(:class, 'o-noteContentHeader__name').size > 0
    creater_image = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img')[:src] if driver.find_elements(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/a/div/img').size > 0
    like = driver.find_element(:class, 'o-noteContentText__likeCount').text if driver.find_elements(:class, 'o-noteContentText__likeCount').size > 0
    price = driver.find_element(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').text if driver.find_elements(:xpath, '//*[@id="__layout"]/div/div[2]/main/article/div[1]/div/div/div[2]/div/div[2]/div/button/div').size > 0
    
    driver.quit
    
    {
      title: title.present? ? title : nil, 
      title_image: title_image.present? ? title_image : nil,
      creater: creater.present? ? creater : nil, 
      creater_image: creater_image.present? ? creater_image : nil, 
      like: like.present? ? like : nil, 
      price: price.present? ? price : nil
    }
  end
  
end