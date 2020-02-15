class Product < ApplicationRecord
  
  has_many :reviews

  accepts_nested_attributes_for :reviews
end
