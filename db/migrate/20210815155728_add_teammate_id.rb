class AddTeammateId < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :teammate_id, :integer, null: false
  end
end
