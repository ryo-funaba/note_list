class Review < ApplicationRecord
  
  belongs_to :users
  belongs_to :products,optional: true
  
end
