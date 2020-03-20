require "csv"

notes_csv = CSV.readlines("db/notes.csv")
notes_csv.each do |row|
  Note.create(url: row[1], title: row[2], title_image: row[3], creater: row[4], creater_image: row[5], like: row[6], price: row[7])
end

reviews_csv = CSV.readlines("db/reviews.csv")
reviews_csv.each do |row|
  Review.create(user_id: row[1], note_id: row[2], rate: row[3], review: row[4])
end