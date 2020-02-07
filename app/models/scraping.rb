class Scraping
  
  require 'mechanize'
  
  def self.get_urls
    
  end
  
  def self.get_products
    agent = Mechanize.new
    page = agent.get("")
    title = page.at('.o-noteContentText__title').inner_text
    creater = page.at('.o-noteContentHeader__name a').inner_text
    image_url = page.at('.o-noteEyecatch img')[:src]
    like = page.at(".o-noteContentText__likeCount").inner_text

    product = Product.where(title: :title, creater: :creater, image_url: :image_url).first_or_initialize
    product.save
  end
  
end