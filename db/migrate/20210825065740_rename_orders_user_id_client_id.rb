class RenameOrdersUserIdClientId < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :user_id, :client_id
  end
end
