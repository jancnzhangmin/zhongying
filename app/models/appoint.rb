class Appoint < ApplicationRecord
  belongs_to :user
  belongs_to :intention
  belongs_to :appointtp
end
