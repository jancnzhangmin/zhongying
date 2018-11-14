class IndustriesController < ApplicationController

  before_action :set_industrie, only: [:show, :edit, :update, :destroy]
  def index
    @industries = Industrie.all
  end

  def edit

  end

  def new
    @industrie = Industrie.new
  end

  def create
    @industrie = Industrie.new(industrie_params)
    respond_to do |format|
      if @industrie.save
        format.html { redirect_to industries_path, notice: 'Appointtp was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @industrie.update(industrie_params)
        format.html { redirect_to industries_path, notice: 'Appointtp was successfully updated.' }
        format.json { render :show, status: :ok, location: @industrie }
      else
        format.html { render :edit }
        format.json { render json: @industrie.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @industrie.destroy
    respond_to do |format|
      format.html { redirect_to industries_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_industrie
    @industrie = Industrie.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def industrie_params
    params.require(:industrie).permit(:industrie)
  end

end
