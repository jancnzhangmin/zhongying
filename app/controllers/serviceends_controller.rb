class ServiceendsController < ApplicationController

  def index
    @products = Product.where('overdue > ? and overdue < ? and overdue is not null',Time.now,Time.now + 30.days)
  end

end
