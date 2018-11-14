class ApisController < ApplicationController

  def getintentionlist
    intentions = Intention.where('transcustomer is null or transcustomer <> ?',1).order('id desc').paginate(:page => params[:page], :per_page => 10)
    render json: params[:callback]+'({"intentions":'+ intentions.to_json + '})',content_type: "application/javascript"
  end

  def test
    debugger
  end

  def getaccesstoken
    render json: params[:callback]+'({"access_token":"'+ $client.access_token + '","appid":"wx9ba0afe3f3f1aa14"})',content_type: "application/javascript"
  end

end
