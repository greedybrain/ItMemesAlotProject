class Post < ApplicationRecord

     has_one_attached :image_url
     belongs_to :user
     has_many :comments, dependent: :destroy
     has_many :likes, dependent: :destroy
     has_many :users, through: :comments
     has_many :users, through: :likes

end
