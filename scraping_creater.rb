require 'mechanize'

agent = Mechanize.new
page = agent.get("https://note.com/kazu55555/n/nc469e52c5cae")
elements = page.search(".o-noteContentHeader__name a")
elements.each do |ele|
  puts ele.inner_text
end