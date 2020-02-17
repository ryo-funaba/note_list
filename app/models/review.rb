class Review < ApplicationRecord
  
  belongs_to :users
  belongs_to :notes,optional: true
  attr_accessor :url
 
  before_validation :set_url
  
  private
  def set_url
    note = Note.find_or_initialize_by(url: url)
    note.save!
    
    review.note = note
  end

end