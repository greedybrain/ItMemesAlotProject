class UsersController < Devise::RegistrationsController
     before_action :authenticate_user!

     def show
          @user = User.find(params[:id])
          @posts = current_user.posts
     end

end
