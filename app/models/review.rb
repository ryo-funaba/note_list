class Review < ApplicationRecord
  
  belongs_to :users
  belongs_to :notes,optional: true
  
  attr_accessor :url
end
