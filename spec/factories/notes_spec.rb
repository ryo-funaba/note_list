FactoryBot.define do
  factory :note do
    url { "https://note.com/daikawai/n/nf5bdcba44182" }
    title { "【保存版】プログラミングで何を学べばどんなアプリを作れるのかまとめてみました。" }
    title_image { "https://assets.st-note.com/production/uploads/images/6923400/rectangle_large_type_2_b43fc9c2e24197861a667a8978dc2acf.jpg?fit=bounds&quality=60&width=1280" }
    creater { "Dai" }
    creater_image { "https://assets.st-note.com/production/uploads/images/4411318/profile_53d5f3f9da8d9ec6a2a7b8712c59cdea.jpeg?fit=bounds&format=jpeg&quality=45&width=330" }
    like { 1675 }
    price { "¥1,980" }
    
  end
end