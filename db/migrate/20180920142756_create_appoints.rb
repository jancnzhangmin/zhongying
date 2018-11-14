class CreateAppoints < ActiveRecord::Migration[5.2]
  def change
    create_table :appoints do |t|
      t.bigint :intention_id
      t.bigint :user_id
      t.bigint :appointtp_id
      t.datetime :appointtime
      t.text :summary

      t.timestamps
    end
  end
end
