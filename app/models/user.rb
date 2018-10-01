class User < ApplicationRecord
  has_one :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone, :contact_method
  enum contact_method: [:email, :text, :call]
end
