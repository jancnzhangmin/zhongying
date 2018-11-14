class Customer < ApplicationRecord
  has_many :products,dependent: :destroy
  belongs_to :user
  has_many :customerappoints,dependent: :destroy
  belongs_to :industrie
  has_many :transcustomers
  belongs_to :customertype, optional: true
  has_many :pacts
end
