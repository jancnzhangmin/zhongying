class CreateAppointtps < ActiveRecord::Migration[5.2]
  def change
    create_table :appointtps do |t|
      t.string :appointtype

      t.timestamps
    end
  end
end
