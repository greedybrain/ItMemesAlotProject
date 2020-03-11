class Post < ApplicationRecord

     has_one_attached :image_url
     belongs_to :user
     has_many :comments
     has_many :users, through: :comments

end
