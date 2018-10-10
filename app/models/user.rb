class User < ApplicationRecord
  has_one :company
  has_many :queries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google]

  validates_presence_of :email, :first_name
  enum contact_method: [:email, :text, :call]

  def self.from_omniauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create!(
          provider: auth.provider,
          email: auth.info.email,
          first_name: auth.info.email.split('@')[0],
          uid: auth.uid,
          is_hunter: 1,
          is_realtor: 0,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end 
end
