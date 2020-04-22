FactoryBot.define do
  factory :review do
    url { 'https://note.com/daikawai/n/nf5bdcba44182' }
    rate { 5 }
    review { 'いいね' }
    note
    user
  end
end