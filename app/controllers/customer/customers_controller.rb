class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
    @posts = Post.page(params[:page])
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_mypage_path
  end
  
  def search
    if params[:name].present?
      @customers = Customer.where('name LIKE ?', "%#{params[:name]}%")
    else
      @customers = Customer.none
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted)
  end
end
