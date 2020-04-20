FactoryBot.define do
  factory :review do
    url { 'test_url' }
    rate { 5 }
    review { 'いいね' }
    user
  end
end