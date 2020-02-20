class Scraping
  
  require 'mechanize'
  
  def self.get_products(url)
    agent = Mechanize.new
    page = agent.get(url)
    title = page.at('.o-noteContentText__title').inner_text
    creater = page.at('.o-noteContentHeader__name a').inner_text
    image_url = page.at('.o-noteEyecatch img')[:src]
    like = page.at(".o-noteContentText__likeCount").inner_text

    note = Note.where(title: :title, creater: :creater, image_url: :image_url).first_or_initialize
    note.save
  end
  
end