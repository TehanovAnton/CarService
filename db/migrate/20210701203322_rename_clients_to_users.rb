class RenameClientsToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :clients, :users
  end
end
