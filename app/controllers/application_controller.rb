class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected

  def customer_shut_out
    unless admin_signed_in?
      redirect_to top_path
    end
  end

end
