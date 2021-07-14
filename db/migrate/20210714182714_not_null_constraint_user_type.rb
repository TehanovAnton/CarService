class NotNullConstraintUserType < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :type, false
  end
end
