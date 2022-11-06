class Customer::FollowsController < ApplicationController
  

  def index
    #customer = Customer.find(params[:customer_id])
    @customer = customer.followers
  end
  
  # フォローするとき
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end
  
  # フォロー外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer  
  end
  
  # フォロー一覧
  #def followings
    #customer = Customer.find(params[:customer_id])
    #@customer = customer.followings
  #end
  
  # フォロワー一覧
  #def followers
    #customer = Customer.find(params[:customer_id])
    #@customer = customer.followers
  #end
  
  
end
