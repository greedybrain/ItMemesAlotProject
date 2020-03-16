class UsersController < Devise::RegistrationsController
     before_action :authenticate_user!

     def show
          @user = User.find(params[:id])
          @posts = @user.posts
     end

end
