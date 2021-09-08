class RemovePriceService < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :price
  end
end
