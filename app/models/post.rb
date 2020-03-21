class Post < ApplicationRecord
     acts_as_taggable

     has_one_attached :image_url
     belongs_to :user
     has_many :comments, dependent: :destroy
     has_many :likes, dependent: :destroy
     has_many :users, through: :comments
     has_many :users, through: :likes

     # validates_acceptance_of :image_url, :content_type => ["image/jpg", "image/jpeg", "image/png"]

     scope :memes_on_fire, -> { order("(likes_count + comments_count) / 2 DESC").limit(10) }

end
