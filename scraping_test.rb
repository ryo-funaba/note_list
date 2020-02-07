require 'mechanize'
  
  
  agent = Mechanize.new
  page = agent.get("https://note.com/kazu55555/n/nc469e52c5cae")
  title = page.at('.o-noteContentText__title').inner_text
  creater = page.at('.o-noteContentHeader__name a').inner_text
  image_url = page.at('.o-noteEyecatch img')[:src]
  like = page.at(".o-noteContentText__likeCount").inner_text
  
  puts title
  puts creater
  puts image_url
  puts like