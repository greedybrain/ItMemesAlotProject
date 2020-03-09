class PostsController < ApplicationController
     before_action :authenticate_user!, except: [:index]

     def index 
          @posts = Post.all
     end

     def show
          if params[:user_id]
               @user = User.find(params[:user_id])
               @post = @user.posts.find(params[:id])
          else
               redirect_to posts_path
          end
     end

     def new
          @post = current_user.posts.build
     end

     def create
          @post = Post.new(post_params)
          if @post.save 
               redirect_to user_post_path(@post), notice: "Post created"
          else
               render :new, alert: "Something went wrong"
          end
     end

     def edit
          @post = Post.find(params[:id])
     end

     def update
          @post = Post.find(params[:id])
          if @post.update(post_params)
               redirect_to post_path(@post), notice: "Post updated"
          else 
               render :edit
          end
     end

     def destroy
          @post = Post.find(params[:id])
          @post.destroy 
          redirect_to posts_path
     end

     private

     def post_params
          params.require(:post).permit(:image_url, :user_id)
     end

end
