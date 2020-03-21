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

end
