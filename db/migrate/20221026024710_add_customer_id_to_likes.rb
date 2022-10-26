class AddCustomerIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :customer_id, :integer, null: false
  end
end
