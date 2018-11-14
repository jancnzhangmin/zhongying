class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  def index
    @customers = Customer.all.order('id desc')
    if params[:search]
      @customers = Customer.where('commpany like ? or contact like ? or contactphone like ?',"%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order('id desc')
    end
    if params[:type] && params[:type] == 'normal'
      normalids = []
      @customers.each do |f|
        if f.customertype && f.customertype.keyword == 'normal'
          normalids.push f.id
        end
      end
      @customers = @customers.where('id in (?)',normalids)
    end
    if params[:type] && params[:type] == 'public'
      normalids = []
      @customers.each do |f|
        if f.customertype && f.customertype.keyword == 'public'
          normalids.push f.id
        end
      end
      @customers = @customers.where('id in (?)',normalids)
    end
    if params[:type] && params[:type] == 'inservice'
      normalids = []
      @customers.each do |f|
        if f.customertype && f.customertype.keyword == 'inservice'
          normalids.push f.id
        end
      end
      @customers = @customers.where('id in (?)',normalids)
    end
    if params[:type] && params[:type] == 'outservice'
      normalids = []
      @customers.each do |f|
        if f.customertype && f.customertype.keyword == 'outservice'
          normalids.push f.id
        end
      end
      @customers = @customers.where('id in (?)',normalids)
    end
  end

  def edit
    getprovince
  end

  def new
    @customer = Customer.new
    getcity
  end

  def create
    @customer = Customer.new(set_industrie(customer_params))
    @customer.user_id = 1
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_pacts_path(@customer), notice: 'Appointtp was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

      if @customer.update(set_industrie(customer_params))
        format.html { redirect_to customers_path, notice: 'Appointtp was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show
    @appoints = @customer.customerappoints
  end

  def getprovince
    @province = Chinadistrict.where('code like ?','%0000')
    customer = Customer.find(params[:id])
    @selectprovince = ''
    @city =[]
    @selectcity = ''
    @district = []
    @selectdistrict = ''
    if customer.province.length > 0
      @selectprovince = customer.province
      provincecode = Chinadistrict.find_by_address(customer.province).code
      @city = Chinadistrict.where('code like ? and code <> ?',"#{provincecode[0,2] +'__00'}",provincecode)
    end
    if customer.city.length > 0
      @selectcity = customer.city
      citycode = Chinadistrict.find_by_address(customer.city).code
      @district = Chinadistrict.where('code like ? and code <> ?',"#{citycode[0,4] + '__'}",citycode)
    end
    if customer.district.length > 0
      @selectdistrict = customer.district
    end
  end

  def getcity
    @province = Chinadistrict.where('code like ?','%0000')
    @city=[]
    if params[:customer]
      province = Chinadistrict.find_by_address(params[:customer][:province])
      @city = Chinadistrict.where('code like ? and code <> ?',"#{province.code[0,2] +'__00'}",province.code)
    end
  end

  def getdistrict
    if params[:customer]
      city = Chinadistrict.find_by_address(params[:customer][:city])
      @district = Chinadistrict.where('code like ? and code <> ?',"#{city.code[0,4] + '__'}",city.code)
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:user_id, :commpany, :contact, :contactphone, :province, :city, :district, :address, :summary, :industrie_id, :customertype_id, :entertime)
  end

  def set_industrie(customer_params)
    #.strip
    industrie = Industrie.find_by_industrie(customer_params[:industrie_id].strip)
    if !industrie
      industrie = Industrie.create(industrie:customer_params[:industrie_id].strip)
    end
    customer_params[:industrie_id].clear
    customer_params[:industrie_id] << industrie.id.to_s
    customer_params
  end

end
