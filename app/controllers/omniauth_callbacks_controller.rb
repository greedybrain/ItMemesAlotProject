class OmniauthCallbacksController < Devise::OmniauthCallbacksController
     def github
          @user = User.from_omniauth(request.env["omniauth.auth"])
          sign_in_and_redirect @user, notice: "You've logged in successfully with github"
     end
end