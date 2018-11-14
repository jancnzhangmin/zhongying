class Industrie < ApplicationRecord
  has_many :intentions
  has_many :customers
end
