class PayType < ActiveRecord::Base
  
  def self.get_pay_types
    if PayType.table_exists?
       pts = PayType.all
       payment_types = []
       pts.each do |pt|
         payment_types << [pt.name,pt.id]
       end
    else
       payment_types = [
        # Displayed         #stored in orders table in db
        ["Check",        "check"],
        ["Credit Card",    "cc"],
        ["Purchase Order", "po"]
        ]
    end
    payment_types
  end
  
end
