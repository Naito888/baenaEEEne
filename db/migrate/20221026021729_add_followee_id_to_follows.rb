class AddFolloweeIdToFollows < ActiveRecord::Migration[6.1]
  def change
    add_column :follows, :followee_id, :integer, null: false
  end
end
