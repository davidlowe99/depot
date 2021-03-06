class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  # PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :name, :address, :email, presence: true
  # validates :pay_type, inclusion: PAYMENT_TYPES
  # validates :pay_type, inclusion: PayType.get_pay_types.map{|disp,value| disp}
  validates_presence_of :pay_type
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end


end
