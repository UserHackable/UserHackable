class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user and @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        data = session["devise.google_data"] = request.env["omniauth.auth"]
        info = data.info
        email = info["email"]
        name = info["name"]
        first_name = info["first_name"]
        last_name = info["last_name"]
        image = info["image"]
        # puts image.urls.inspect
        flash[:notice] = "No User: #{email}"
        redirect_to new_user_registration_url
      end
  end

end
