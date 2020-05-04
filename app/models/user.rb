class User < ApplicationRecord
  has_many :posts
  has_many :comments
  #has_one??? :verbalmarks

 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
end
