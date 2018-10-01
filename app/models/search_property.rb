class SearchProperty < ApplicationRecord
  INTEGER_MAX = 2147483647

  SIZE_MAPPING = {
    1 => [0, 500],
    2 => [500, 1500],
    3 => [1500, 3000],
    4 => [3000, INTEGER_MAX]
  }

  PRICE_MAPPING = {
    1 => [0, 100000],
    2 => [100000, 250000],
    3 => [250000, 500000],
    4 => [500000, 1000000],
    5 => [1000000, INTEGER_MAX]
  }

  def search_properties
    puts SIZE_MAPPING[size]
    properties = Property.all
    properties = properties.where(:size => SIZE_MAPPING[size.to_i][0]...SIZE_MAPPING[size.to_i][1]) if size.present?
    properties = properties.where(['address LIKE ?', "%#{address}%"]) if address.present? && address != ""
    properties = properties.where(:price => PRICE_MAPPING[price.to_i][0]...PRICE_MAPPING[price.to_i][1]) if price.present?
    return properties
  end
end
