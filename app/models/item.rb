class Item < ApplicationRecord
  belongs_to :genre
  mount_uploader :picture, PictureUploader
  validate  :picture_size

  private
  
    def picture_size
       if picture.size > 5.megabytes
        errors.add(:picture, "5MB以下の画像をアップロードしてください")
      end
    end
  
end
