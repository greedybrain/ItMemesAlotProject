class CommentsController < ApplicationController
     before_action :authenticate_user!                      

     def create
          if params[:post_id]
               create_post_comment_and_update_post_escore
               redirect_to user_post_path(@post.user, @post)
          else 
               redirect_to root_path, alert: "You must be logged in to do that"
          end
     end

     def destroy
          if params[:post_id]
               @post = Post.find(params[:post_id])
               @comment = @post.comments.find(params[:id])
               @comment.post.comments_count -= 1
               recalc_escore
               @comment.post.save
               @comment.destroy 
               redirect_to user_post_path(@post.user, @post)
          end
     end

     private 

     def comment_params
          params.require(:comment).permit(:content, :user_id)
     end

end
