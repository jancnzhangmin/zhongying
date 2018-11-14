class AppointsController < ApplicationController

  def create
    intention = Intention.find(params[:intention_id])
    intention.appoints.create(appoint_params)
    redirect_to intention_path(intention)
  end

  def destroy
    intention = Intention.find(params[:intention_id])
    appoint = Appoint.find(params[:id])
    appoint.destroy
    redirect_to intention_path(intention)
  end

  private

  def appoint_params
    params.require(:appoint).permit(:user_id, :appointtp_id, :appointtime, :summary)
  end

end
