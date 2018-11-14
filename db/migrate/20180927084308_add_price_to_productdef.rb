class AddPriceToProductdef < ActiveRecord::Migration[5.2]
  def change
    add_column :productdefs, :price, :float
  end
end
