class CartItem < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :item_id, uniqueness: { scope: :user_id }
    validates :amount, presence: :true, numericality: { only_integer: true }
end
