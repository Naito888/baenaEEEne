class Customer::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer.id)
  end
  
  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email, :telephone_number, :is_deleted)
  end
end
