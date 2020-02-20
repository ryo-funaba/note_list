class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :note, optional:true
  attr_accessor :url
 
  before_save :set_url
  
  private
  def set_url
    note = Note.find_or_initialize_by(url: url)
    note.save!
    Rails::logger::debug('-----------')
    Rails::logger::debug(note.inspect)
    self.note = note
  end

end