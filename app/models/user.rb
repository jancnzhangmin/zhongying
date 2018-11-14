class User < ApplicationRecord
  has_secure_password
  has_many :customers
  has_many :customerapponts
  has_many :intentions
  has_many :apponts
end
