class LikesController < ApplicationController
     before_action :authenticate_user!
     
     def create
          like_post_if_not_liked_already
     end

     def destroy
          @like = Like.find_by(user_id: current_user.id)
          @post_like = Like.find_by(user_id: current_user.id, post_id: @like.post_id)
          @post_like.post.likes_count -= 1
          @post_like.post.save
          @post_like.destroy
          redirect_to user_post_path(@like.post.user, @like.post)
     end

     private 

     def like_params 
          params.require(:like).permit(:user_id)
     end

end
