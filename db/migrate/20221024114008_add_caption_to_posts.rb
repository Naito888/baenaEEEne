class AddCaptionToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :caption, :text, null: false
  end
end
