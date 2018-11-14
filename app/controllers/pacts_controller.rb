class PactsController < ApplicationController
  before_action :set_pact, only: [:index, :new, :create, :edit, :update, :destroy]
  def index
    @pacts = @customer.pacts
  end

  def new
    @pact = @customer.pacts.new
  end

  def edit
    @pact = Pact.find(params[:id])
  end

  def create
    @customer.pacts.create(pact_params)
    redirect_to customer_pacts_path(@customer)
  end

  def update
    @pact = Pact.find(params[:id])
    @pact.update(pact_params)
    redirect_to customer_pacts_path(@customer)
  end

  def destroy
    @pact = Pact.find(params[:id])
    @pact.destroy
    redirect_to customer_pacts_path(@customer)
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_pact
    @customer = Customer.find(params[:customer_id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def pact_params
    params.require(:pact).permit(:pacttype_id, :name, :signtime, :begintime, :endtime, :pactnumber, :amount)
  end
end
