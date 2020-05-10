class Item < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validate  :picture_size
  validates :name, presence: true
  validates :introduction, presence: true, length: { in: 1..500 }
  validates :genre_id, presence: :true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :sales_status, inclusion: { in: [true, false] }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  private
  
    def picture_size
       if picture.size > 5.megabytes
        errors.add(:picture, "5MB以下の画像をアップロードしてください")
      end
    end
  
end
