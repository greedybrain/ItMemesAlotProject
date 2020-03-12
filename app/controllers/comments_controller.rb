class CommentsController < ApplicationController

     def create
          if params[:post_id] && user_signed_in?
               @post = Post.find(params[:post_id])
               @comment = @post.comments.create(comment_params)
               redirect_to user_post_path(@post.user, @post)
          else 
               redirect_to root_path, alert: "You must be logged in to do that"
          end
     end

     def destroy
          if params[:post_id]
               @post = Post.find(params[:post_id])
               @comment = @post.comments.find(params[:id])
               @comment.destroy 
               redirect_to user_post_path(@post.user, @post)
          end
     end

     private 

     def comment_params
          params.require(:comment).permit(:content, :user_id)
     end

     def updatable_params
          params.require(:comment).permit(:content)
     end

end
