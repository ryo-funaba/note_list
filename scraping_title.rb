require 'mechanize'

agent = Mechanize.new
page = agent.get("https://note.com/kazu55555/n/nc469e52c5cae")
elements = page.search(".o-noteContentText__title")
elements.each do |ele|
  puts ele.inner_text
end