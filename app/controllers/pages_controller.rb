class PagesController < ApplicationController
     
     def home 
          @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 9)
     end

end
