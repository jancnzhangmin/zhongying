class TranscustomersController < ApplicationController

  def index
    @transcustomers = Transcustomer.all.order('id desc')
  end

  def new
    @intention = Intention.find(params[:intention_id])
    @selectindustrie = @intention.industrie_id
    getprovince
  end

  def create
    customer = Customer.new(customer_params)
    customer.user_id = 1
    customer.save
    @intention = Intention.find(params[:intention_id])
    @intention.transcustomer = 1
    @intention.save
    customer.transcustomers.create(intention_id:@intention.id)
    intentionappoints = @intention.appoints
    intentionappoints.each do |f|
      customer.customerappoints.create(user_id:f.user_id, appointtp_id:f.appointtp_id, appointtime:f.appointtime, summary:f.summary)
    end
  end

  def getprovince
    @province = Chinadistrict.where('code like ?','%0000')
    intention = Intention.find(params[:intention_id])
    @selectprovince = ''
    @city =[]
    @selectcity = ''
    @district = []
    @selectdistrict = ''
    if intention.province.length > 0
      @selectprovince = intention.province
      provincecode = Chinadistrict.find_by_address(intention.province).code
      @city = Chinadistrict.where('code like ? and code <> ?',"#{provincecode[0,2] +'__00'}",provincecode)
    end
    if intention.city.length > 0
      @selectcity = intention.city
      citycode = Chinadistrict.find_by_address(intention.city).code
      @district = Chinadistrict.where('code like ? and code <> ?',"#{citycode[0,4] + '__'}",citycode)
    end
    if intention.district.length > 0
      @selectdistrict = intention.district
    end
  end

  def getcity
    @province = Chinadistrict.where('code like ?','%0000')
    @city=[]
    if params[:tran]
      province = Chinadistrict.find_by_address(params[:tran][:province])
      @city = Chinadistrict.where('code like ? and code <> ?',"#{province.code[0,2] +'__00'}",province.code)
    end
  end

  def getdistrict
    if params[:tran]
      city = Chinadistrict.find_by_address(params[:tran][:city])
      @district = Chinadistrict.where('code like ? and code <> ?',"#{city.code[0,4] + '__'}",city.code)
    end
  end

  private
  def customer_params
    params.require(:tran).permit(:commpany, :contact, :contactphone, :province, :city, :district, :address, :summary, :industrie_id)
  end

end
