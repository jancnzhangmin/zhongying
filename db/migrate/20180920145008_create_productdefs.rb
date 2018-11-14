class CreateProductdefs < ActiveRecord::Migration[5.2]
  def change
    create_table :productdefs do |t|
      t.string :name
      t.string :model
      t.string :unit
      t.text :summary
      t.integer :overdue

      t.timestamps
    end
  end
end
