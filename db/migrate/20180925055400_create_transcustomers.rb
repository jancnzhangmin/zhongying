class CreateTranscustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :transcustomers do |t|
      t.bigint :intention_id
      t.bigint :customer_id

      t.timestamps
    end
  end
end
