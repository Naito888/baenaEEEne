class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def edit
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted)
  end

end
