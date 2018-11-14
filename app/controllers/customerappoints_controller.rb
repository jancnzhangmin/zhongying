class CustomerappointsController < ApplicationController

  def create
    customer = Customer.find(params[:customer_id])
    customer.customerappoints.create(customerappoint_params)
    redirect_to customer_path(customer)
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    customerappoint = Customerappoint.find(params[:id])
    customerappoint.destroy
    redirect_to customer_path(customer)
  end

  private

  def customerappoint_params
    params.require(:customerappoint).permit(:user_id, :appointtp_id, :appointtime, :summary)
  end

end
