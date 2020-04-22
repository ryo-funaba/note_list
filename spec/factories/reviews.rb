FactoryBot.define do
  factory :review do
    url { "https://note.com/daikawai/n/nf5bdcba44182" }
    rate { 5 }
    review { "初レビュー" }
    note_id { 1 }
    note
    user
  end
end