class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
    #Just for fun
    @count = increment_count
    #Just for fun
  end
  
  #Just for fun
  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end
  #Just for fun
end
