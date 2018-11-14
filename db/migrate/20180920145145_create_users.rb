class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :openid
      t.string :unionid
      t.string :headurl
      t.string :login
      t.string :password_digest
      t.integer :wxauth
      t.integer :status

      t.timestamps
    end
  end
end
