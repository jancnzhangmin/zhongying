class CustomertypesController < ApplicationController
  before_action :set_customertype, only: [:show, :edit, :update, :destroy]
  def index
    @customertypes = Customertype.all
  end

  def edit

  end

  def new
    @customertype = Customertype.new
  end

  def create
    @customertype = Customertype.new(customertype_params)
    respond_to do |format|
      if @customertype.save
        format.html { redirect_to customertypes_path, notice: 'Customertype was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customertype.update(customertype_params)
        format.html { redirect_to customertypes_path, notice: 'Customertype was successfully updated.' }
        format.json { render :show, status: :ok, location: @customertype }
      else
        format.html { render :edit }
        format.json { render json: @customertype.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @customertype.destroy
    respond_to do |format|
      format.html { redirect_to customertypes_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_customertype
    @customertype = Customertype.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def customertype_params
    params.require(:customertype).permit(:name, :keyword)
  end
end
