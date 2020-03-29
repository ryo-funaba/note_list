class Note < ApplicationRecord
  
  has_many :reviews

  def thumbnail
    avatar.variant(resize: '50x50')
  end
end