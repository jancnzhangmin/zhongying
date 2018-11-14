class CreateIntentions < ActiveRecord::Migration[5.2]
  def change
    create_table :intentions do |t|
      t.bigint :user_id
      t.string :commpany
      t.string :contact
      t.string :contactphone
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.text :summary
      t.integer :transcustomer

      t.timestamps
    end
  end
end
