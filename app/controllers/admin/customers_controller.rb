class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.page(params[:page])
  end

  def show

  end

  def edit
  end

  def destroy
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted)
  end

end
