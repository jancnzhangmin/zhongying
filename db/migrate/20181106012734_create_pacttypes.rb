class CreatePacttypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pacttypes do |t|
      t.string :pacttype

      t.timestamps
    end
  end
end
