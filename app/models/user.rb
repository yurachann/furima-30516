class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_read, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_read,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end
