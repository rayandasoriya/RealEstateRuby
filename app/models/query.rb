class Query < ApplicationRecord
  belongs_to :user
  belongs_to :property
  has_many :reply
end
