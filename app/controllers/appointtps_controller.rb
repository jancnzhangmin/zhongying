class AppointtpsController < ApplicationController

  before_action :set_appointtp, only: [:show, :edit, :update, :destroy]
  def index
    @appointtps = Appointtp.all
  end

  def edit

  end

  def new
    @appointtp = Appointtp.new
  end

  def create
    @appointtp = Appointtp.new(appointtp_params)
    respond_to do |format|
      if @appointtp.save
        format.html { redirect_to appointtps_path, notice: 'Appointtp was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointtp.update(appointtp_params)
        format.html { redirect_to appointtps_path, notice: 'Appointtp was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointtp }
      else
        format.html { render :edit }
        format.json { render json: @appointtp.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @appointtp.destroy
    respond_to do |format|
      format.html { redirect_to appointtps_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_appointtp
    @appointtp = Appointtp.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def appointtp_params
    params.require(:appointtp).permit(:appointtype)
  end

end
