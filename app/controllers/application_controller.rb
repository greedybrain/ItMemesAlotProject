class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     helper_method :like_post_if_not_liked_already, :all_users_that_liked_this_post

     protected

     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :profile_image])
     end

     # POST CONTROLLER HELPER METHODS

     def like_post_if_not_liked_already
          if params[:post_id]
               @post = Post.find(params[:post_id])
               if @post.likes.collect{|like| like.user_id }.count(current_user.id) >= 1
                    redirect_to user_post_path(@post.user, @post), alert: "You already liked this post"
               else
                    @like = @post.likes.create(like_params)
                    @post.likes_count += 1
                    @post.save
                    redirect_to user_post_path(@post.user, @post)
               end
          end
     end

     def all_users_that_liked_this_post
          @users_that_liked = @post.likes.collect do |like|
               User.find(like.user_id)
          end
     end
     
end
