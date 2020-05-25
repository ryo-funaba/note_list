require "csv"

reviews_csv = CSV.readlines("db/seeds/csv/reviews.csv")
reviews_csv.each do |row|
  Review.create(user_id: row[1], note_id: row[2], rate: row[3], review: row[4])
end