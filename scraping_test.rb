require 'mechanize'
  
  
  agent = Mechanize.new
  page = agent.get("https://note.com/cohki0305/n/n061d6fca4b01?creator_urlname=cohki0305")
  title = page.at('.o-noteContentText__title').inner_text
  title_image = page.at('.o-noteEyecatch img')[:src]
  creater = page.at('.o-noteContentHeader__name a').inner_text
  creater_image = page.at('.m-avatar img')[:src]

  puts title
  puts title_image
  puts creater
  puts creater_image