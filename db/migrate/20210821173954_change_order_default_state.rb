class ChangeOrderDefaultState < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :state, 'in_review'
  end
end
