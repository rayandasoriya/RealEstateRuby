class Company < ApplicationRecord
  has_many :users
  validates_presence_of :name, :address, :website
  validates_length_of :year_founded, is: 4,  message: "Year must be in YYYY"
  enum size: [:"0-50", :"51-200", :"201-500", :"501-1000", :"1000+"]
  validates :website, :format => { :with => URI::regexp(%w(http https)), :message => “Valid URL required”}
end
