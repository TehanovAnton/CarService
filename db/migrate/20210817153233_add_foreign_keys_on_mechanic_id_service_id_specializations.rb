class AddForeignKeysOnMechanicIdServiceIdSpecializations < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :specializations, :users, column: :mechanic_id, primar_key: :id
    add_foreign_key :specializations, :services, column: :service_id, primar_key: :id
  end
end
