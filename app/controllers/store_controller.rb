class StoreController < ApplicationController
	before_action :set_session_count, only: [:index] 
  def index
  	@products = Product.order(:title) 
  end

  private
  def set_session_count
  	if session[:counter].nil?
  		session[:counter] = 1
  	else
  		session[:counter] += 1
  	end
  	@counter = session[:counter]	
  end	
end
