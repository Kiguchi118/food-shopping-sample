class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  enum payment_method: {
    bank_transfer: 0,
    credit_card_payment: 1,
    convenience_store_payment: 2,
    electronic_money_payment: 3,
    cash_on_delivery: 4
  }

  enum order_status: {
    waiting_for_payment: 0,
    payment_confirmation: 1,
    in_production: 2,
    preparing_for_shipment: 3,
    sent: 4
  }

end
