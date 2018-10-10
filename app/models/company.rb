class Company < ApplicationRecord
  has_many :users
  has_many :properties, dependent: :destroy
  validates_presence_of :name, :address, :website
  validates_length_of :year_founded, is: 4,  message: "Year must be in YYYY"
  enum size: [:"0-50", :"51-200", :"201-500", :"501-1000", :"1000+"]
  enum revenue: [:"Below 1 Million", :"1 to 10 Million", :"10 to 100 Million", :"More than 100 Million"]
  validates :website, url: true
end
