class Note < ApplicationRecord
  
  has_many :reviews

  def thumbnail
    return self.avatar.variant(resize: '50x50')
  end
  
end