class CommentsController < ApplicationController
     before_action :authenticate_user!                      

     def create
          if params[:post_id]
               @post = Post.find(params[:post_id])
               @comment = @post.comments.create(comment_params)
               @comment.post.comments_count = @post.comments.length
               @post.save
               redirect_to user_post_path(@post.user, @post)
          else 
               redirect_to root_path, alert: "You must be logged in to do that"
          end
     end

     # def edit 
     #      if params[:post_id]
     #           @post = Post.find(params[:post_id])
     #           @comment = @post.comments.find(params[:id])
     #      end
     # end

     def update 
          @post = Post.find(params[:post_id])
          @comment = @post.comments.find(params[:id])
          if @post.update(comment_params)
               redirect_to user_post_path(@post.user, @post)
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
