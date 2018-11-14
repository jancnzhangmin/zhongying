class Intention < ApplicationRecord
  belongs_to :user
  has_many :appoints, dependent: :destroy
  belongs_to :industrie,optional: true
  has_many :transcustomers
end
