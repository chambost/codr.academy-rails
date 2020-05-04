class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
      else
        @user.email = request.env["omniauth.auth"]["extra"]["all_emails"][0]["email"]
        @user.name = request.env["omniauth.auth"]["info"]["name"]
        @user.username = request.env["omniauth.auth"]["info"]["nickname"]
        @user.github = "https://github.com/#{@user.username}"
        @user.save
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
      end
    end
  
    def failure
      redirect_to root_path
    end
  end