module ApplicationHelper

     def truncate_name_if_too_long(post)
          post.user.name.length >= 15 ? post.user.name[0..10] + '...' : post.user.name
     end

     def shorten_time_format(object)
          begins_with_about = helpers.time_ago_in_words(object.created_at).start_with?("about")
          if begins_with_about
               helpers.time_ago_in_words(object.created_at)[6..-1] + " ago"
          else
               helpers.time_ago_in_words(object.created_at) + " ago"
          end
     end

     def make_large_number_readable(number)
          helpers.number_to_human(
               number, 
               :format => '%n%u', 
               :precision => 2,
               :units => { 
                    :thousand => 'K',
                    :million => 'M',
                    :billion => 'B',
                    :trillion => 'T'
               }
          )
     end

     def recalc_escore
          @post.escore = (@post.comments_count + @post.likes_count) / 2
     end

end
