class SearchProperty < ApplicationRecord
  def search_properties
    properties = Property.all
    properties = properties.where(["address LIKE ?", "%#{address}%"]) if address.present?
    properties = properties.where(["size = ?", size]) if size.present?
    properties = properties.where(["price = ?", price]) if size.present?
    properties
  end
end
