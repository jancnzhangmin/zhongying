class ProductsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @products = @customer.products
  end

  def create
    customer = Customer.find(params[:customer_id])
    customer.products.create(product_params)
    redirect_to customer_products_path(customer)
  end

  def getproduct
    @productdef = Productdef.find(params[:product][:productdef_id])
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    product = Product.find(params[:id])
    product.destroy
    redirect_to customer_products_path(customer)
  end

  private

  def product_params
    params.require(:product).permit(:productdef_id, :price, :number, :overdue)
  end

end
