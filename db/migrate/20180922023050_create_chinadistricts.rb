class CreateChinadistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :chinadistricts do |t|
      t.string :code
      t.string :address

      t.timestamps
    end
  end
end
