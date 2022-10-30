class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_mypage_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted)
  end
end
