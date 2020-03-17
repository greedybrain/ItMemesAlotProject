class LikesController < ApplicationController
     before_action :authenticate_user!

     def show 
          binding.pry
          @post = Post.find(params[:post_id])
          @like = @post.likes.find(params[:id])
          redirect_to post_path(@post)
     end
     
     def create
          like_post_if_not_liked_already
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
