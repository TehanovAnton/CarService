class RenameMailAdressToEmailInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :mail_adress, :email
  end
end
