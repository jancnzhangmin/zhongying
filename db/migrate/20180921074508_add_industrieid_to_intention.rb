class AddIndustrieidToIntention < ActiveRecord::Migration[5.2]
  def change
    add_column :intentions, :industrie_id, :bigint
  end
end
