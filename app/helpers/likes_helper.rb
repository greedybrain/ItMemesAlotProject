module LikesHelper

     # Handling like engagement
     
     def post_liked_already?
          @post = Post.find(params[:post_id])
          liked_already = @post.likes.collect{|like| like.user_id }.count(current_user.id) >= 1
     end

     def create_validate_like_and_update_post_escore
          if post_liked_already?
               redirect_to user_post_path(@post.user, @post), alert: "You already liked this post"
          else
               @like = @post.likes.create(like_params)
               @post.likes_count = @post.likes.length
               recalc_escore
               @post.save
               redirect_to user_post_path(@post.user, @post)
          end
     end

     # Get all users that liked a post

     def all_users_that_liked_this_post
          @users_that_liked = @post.likes.collect do |like|
               User.find(like.user_id)
          end
     end

end
