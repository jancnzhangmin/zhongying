class IntentionsController < ApplicationController

  before_action :set_intention, only: [:show, :edit, :update, :destroy]
  def index
    @intentions = Intention.all.order('id desc')
    if params[:search]
      @intentions = Intention.where('commpany like ? or contact like ? or contactphone like ?',"%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order('id desc')
    end
  end

  def edit
    getprovince
  end

  def new
    @intention = Intention.new
    getcity
  end

  def create
    @intention = Intention.new(intention_params)
    @intention.user_id = 1
    respond_to do |format|
      if @intention.save
        format.html { redirect_to intentions_path, notice: 'Appointtp was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @intention.update(intention_params)
        format.html { redirect_to intentions_path, notice: 'Appointtp was successfully updated.' }
        format.json { render :show, status: :ok, location: @intention }
      else
        format.html { render :edit }
        format.json { render json: @intention.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @intention.destroy
    respond_to do |format|
      format.html { redirect_to intentions_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show
    @appoints = @intention.appoints
  end

  def getprovince
    @province = Chinadistrict.where('code like ?','%0000')
    intention = Intention.find(params[:id])
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
    if params[:intention]
      province = Chinadistrict.find_by_address(params[:intention][:province])
      @city = Chinadistrict.where('code like ? and code <> ?',"#{province.code[0,2] +'__00'}",province.code)
    end
  end

  def getdistrict
    if params[:intention]
      city = Chinadistrict.find_by_address(params[:intention][:city])
      @district = Chinadistrict.where('code like ? and code <> ?',"#{city.code[0,4] + '__'}",city.code)
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_intention
    @intention = Intention.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def intention_params
    params.require(:intention).permit(:user_id, :commpany, :contact, :contactphone, :province, :city, :district, :address, :summary, :transcustomer, :industrie_id)
  end



end
