class LikesController < ApplicationController
     before_action :authenticate_user!, :find_user_and_post, only: [:destroy]
     
     def create
          if params[:post_id]
               create_validate_like_and_update_post_escore
          else
               redirect_to posts_path
          end
     end

     def destroy
          @post_like.post.likes_count -= 1
          @post_like.post.save
          @post_like.destroy
          redirect_to user_post_path(@post_like.user, @post_like.post)
     end

     private 

     def like_params 
          params.require(:like).permit(:user_id)
     end

     def find_user_and_post
          @like = Like.find_by(user_id: current_user.id)
          @post_like = Like.find_by(user_id: current_user.id, post_id: @like.post_id)
     end

end
