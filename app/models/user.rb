class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    NAME_READ_REGEX = /\A[ァ-ヶー－]+\z/
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :nickname
    validates :password,         format: { with: PASSWORD_REGEX}
    validates :family_name,      format: { with: NAME_REGEX }
    validates :first_name,       format: { with: NAME_REGEX }
    validates :family_name_read, format: { with: NAME_READ_REGEX }
    validates :first_name_read,  format: { with: NAME_READ_REGEX }
    validates :birth_date
  end
end
