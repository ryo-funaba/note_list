require 'mechanize'

agent = Mechanize.new
page = agent.get("https://note.com/kazu55555/n/nc469e52c5cae")
elements = page.search(".o-noteEyecatch img")
elements.each do |ele|
  puts ele[:src]
end