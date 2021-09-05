class DropPositionsSpeecializations < ActiveRecord::Migration[6.1]
  def change
    drop_table :positions
    drop_table :specializations
  end
end
