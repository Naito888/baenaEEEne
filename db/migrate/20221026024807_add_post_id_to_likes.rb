class AddPostIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :post_id, :integer, null: false
  end
end
