require "csv"

notes_csv = CSV.readlines("db/seeds/csv/notes.csv")
notes_csv.each do |row|
  Note.create(url: row[1], title: row[2], title_image: row[3], creater: row[4], creater_image: row[5], like: row[6], price: row[7])
end