class Transcustomer < ApplicationRecord
  belongs_to :customer
  belongs_to :intention
end
