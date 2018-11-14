class Customerappoint < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :appointtp
end
