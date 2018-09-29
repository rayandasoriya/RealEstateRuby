class Property < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :owner, :price, :size, :basement, :floors, :style
  enum style: [:townhouse, :apartment]
  enum floors: [:"1", :"2", :"3", :"4", :"5+"]
  has_many_attached :images
end
