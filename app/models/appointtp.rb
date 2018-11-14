class Appointtp < ApplicationRecord
  has_many :appoints
  has_many :customerappoints
end
