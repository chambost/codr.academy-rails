class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :verbal_marks
  #has_one??? :verbalmarks

 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth["extra"]["all_emails"][0]["email"]
      user.password = Devise.friendly_token[0, 20]
      user.name = auth["info"]["name"]
      user.username = auth["info"]["nickname"]
      user.avatar_url = auth["info"]["image"]
      user.github = "https://github.com/#{user.username}"
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
