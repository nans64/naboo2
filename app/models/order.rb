class Order < ApplicationRecord

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  
  def payable_amount
    self.products.sum {|product| product.price}
  end

  after_create :welcome_order

  def welcome_order
    UserMailer.welcome_order(self).deliver_now
  end
end
