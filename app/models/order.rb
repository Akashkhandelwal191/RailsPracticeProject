class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  enum :status, [:pending,:processing,:shipped,:delivered],default: :pending
  has_many :line_items_products, as: :purchasable,dependent: :destroy
  has_one :payment,dependent: :destroy
  before_save :insert_id


  def insert_id
     total_amount = self.user.cart.total_amount
     total_pay_amount = (total_amount*100).to_i
     order = Razorpay::Order.create amount: total_pay_amount, currency: 'INR', receipt: 'TEST'
     self.razorpay_order_id = order.id
  end

end
