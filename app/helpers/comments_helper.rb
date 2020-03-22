module CommentsHelper

     def create_post_comment_and_update_post_escore
          @post = Post.find(params[:post_id])
          @comment = @post.comments.create(comment_params)
          @comment.post.comments_count = @post.comments.length
          recalc_escore
          @post.save
     end

     # def pin_post_owners_comment(comment)
     #      if (comment.user == comment.post.user)
     #           @comments = comment.post.comments
     #           @comments[0]
     #           comment.post.save
     #      end
     # end

end
