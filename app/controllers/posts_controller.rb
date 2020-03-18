class PostsController < ApplicationController
     before_action :authenticate_user!, except: [:index, :show]

     def index
          @posts = Post.all.order("created_at DESC")
     end

     def mofs 
          @mofs = Post.memes_on_fire
     end

     def show
          if params[:user_id]
               @user = User.find(params[:user_id])
               @post = @user.posts.find(params[:id])
               @posts = @user.posts
               @comments = @post.comments
               @likers = all_users_that_liked_this_post
          else
               redirect_to root_path
          end
     end

     def new 
          if params[:user_id]
               if User.exists? && current_user
                    @user = current_user
                    @post = current_user.posts.build
               else
                    redirect_to posts_path, alert: "You must be logged in to do that"
               end
          end
     end

     def create 
          @post = current_user.posts.build(post_params)
          if @post.save 
               redirect_to user_post_path(@post.user, @post)
          else
               render :new, alert: "Something went wrong"
          end
     end

     def edit
          @post = current_user.posts.find(params[:id])
     end

     def update 
          @post = current_user.posts.find(params[:id])
          if @post.update(post_params)
               redirect_to user_post_path(current_user, @post), notice: "Post updated successfully"
          else 
               render :edit
          end
     end

     def destroy
          @post = current_user.posts.find(params[:id])
          @post.destroy
          redirect_to posts_path
     end

     private 

     def post_params 
          params.require(:post).permit(:image_url)
     end

end
