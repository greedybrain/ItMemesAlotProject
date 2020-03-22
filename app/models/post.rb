class Post < ApplicationRecord
     acts_as_taggable

     has_one_attached :image_url
     belongs_to :user
     has_many :comments, dependent: :destroy
     has_many :likes, dependent: :destroy
     has_many :users, through: :comments
     has_many :users, through: :likes

     # validates_acceptance_of :image_url, :content_type => ["image/jpg", "image/jpeg", "image/png"]

     scope :memes_on_fire, -> { order("escore DESC").limit(10) }

      # User.tagged_with(["awesome", "cool"], :any => true)

     def self.search(search)
          if search
               post = self.tagged_with(search, any: true, wild: true).order('created_at DESC')
          else
               self.all.order("created_at DESC")  
          end
     end

end
