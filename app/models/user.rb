class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
         

  def self.from_omniauth(access_token)
    data = access_token.info
    name = data["name"]
    email = data["email"]
    first_name = data["first_name"]
    last_name = data["last_name"]
    image_url = data["image"]
    puts data.to_h.inspect
    if user = User.where(email: email).first
      user.update_attributes(
        name: name,
        first_name: first_name,
        last_name: last_name,
        image_url: image_url
      )

    else
      user = User.create(
        name: name,
        email: email,
        first_name: first_name,
        last_name: last_name,
        image_url: image_url,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end


end
