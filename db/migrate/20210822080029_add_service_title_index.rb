class AddServiceTitleIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :services, :title, unique: true
  end
end
