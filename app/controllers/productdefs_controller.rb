class ProductdefsController < ApplicationController

  before_action :set_productdef, only: [:show, :edit, :update, :destroy]
  def index
    @productdefs = Productdef.all
  end

  def edit

  end

  def new
    @productdef = Productdef.new
  end

  def create
    @productdef = Productdef.new(productdef_params)
    respond_to do |format|
      if @productdef.save
        format.html { redirect_to productdefs_path, notice: 'Appointtp was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @productdef.update(productdef_params)
        format.html { redirect_to productdefs_path, notice: 'Appointtp was successfully updated.' }
        format.json { render :show, status: :ok, location: @productdef }
      else
        format.html { render :edit }
        format.json { render json: @productdef.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @productdef.destroy
    respond_to do |format|
      format.html { redirect_to productdefs_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_productdef
    @productdef = Productdef.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def productdef_params
    params.require(:productdef).permit(:name, :model, :unit, :summary, :overdue, :price)
  end

end
