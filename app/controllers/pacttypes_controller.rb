class PacttypesController < ApplicationController
  before_action :set_pacttype, only: [:show, :edit, :update, :destroy]
  def index
    @pacttypes = Pacttype.all
  end

  def edit

  end

  def new
    @pacttype = Pacttype.new
  end

  def create
    @pacttype = Pacttype.new(pacttype_params)
    respond_to do |format|
      if @pacttype.save
        format.html { redirect_to pacttypes_path, notice: 'Pacttype was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @pacttype.update(pacttype_params)
        format.html { redirect_to pacttypes_path, notice: 'Pacttype was successfully updated.' }
        format.json { render :show, status: :ok, location: @pacttype }
      else
        format.html { render :edit }
        format.json { render json: @pacttype.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @pacttype.destroy
    respond_to do |format|
      format.html { redirect_to pacttypes_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_pacttype
    @pacttype = Pacttype.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def pacttype_params
    params.require(:pacttype).permit(:pacttype)
  end
end
