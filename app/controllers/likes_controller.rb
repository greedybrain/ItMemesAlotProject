class LikesController < ApplicationController
     before_action :authenticate_user!
     
     def create
          if params[:post_id]
               @post = Post.find(params[:post_id])
               already_liked = @post.likes.collect{|like| like.user_id == current_user.id}.count >= 1
               if already_liked
                    redirect_to user_post_path(@post.user, @post), alert: "You already liked this post"
               else
                    @like = @post.likes.create(like_params)
                    redirect_to user_post_path(@post.user, @post)
               end
          end
     end

     def destroy
          @post = Post.find(params[:post_id])
          @like = @post.likes.find(params[:id])
          @like.destroy
          redirect_to user_post_path(@post.user, @post)
     end

     private 

     def like_params 
          params.require(:like).permit(:user_id)
     end

end
