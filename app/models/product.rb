class Product < ApplicationRecord
  belongs_to :productdef
  belongs_to :customer
end
