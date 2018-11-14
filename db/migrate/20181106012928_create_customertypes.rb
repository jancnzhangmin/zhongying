class CreateCustomertypes < ActiveRecord::Migration[5.2]
  def change
    create_table :customertypes do |t|
      t.string :name
      t.string :keyword

      t.timestamps
    end
  end
end
