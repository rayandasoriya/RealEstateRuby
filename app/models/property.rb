class Property < ApplicationRecord
  belongs_to :company
  validates_presence_of :address, :owner, :price, :size
  enum basement: [:No, :Yes]
  enum style: [:townhouse, :apartment]
  enum floors: [:"1", :"2", :"3", :"4", :"5+"]
  # has_many_attached :images
  mount_uploader :image, ImageUploader
  serialize :image, JSON
end
