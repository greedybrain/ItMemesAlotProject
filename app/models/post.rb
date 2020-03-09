class Post < ApplicationRecord

     has_one_attached :image_url

     # private

     # def correct_image_type
     #      if image_url.attached? && !image_url.content_type.in?(%w(image/jpeg image/jpg image/png))
     #           errors.add(:image_url, "'s extension must be JPEG, JPG or PNG.")
     #      elsif !image_url.attached?
     #           errors.add(:image_url, 'required.')
     #      end
     # end
end
