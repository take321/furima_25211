class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@.+/}
  validates :password, presence: true, length: { minimum: 6 }
  validates_format_of :password, {with: PASSWORD_REGEX}
  validates :password_confirmation, presence: true
end
