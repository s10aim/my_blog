class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :registerable
  devise :database_authenticatable,
         :rememberable, :validatable, :trackable
end
