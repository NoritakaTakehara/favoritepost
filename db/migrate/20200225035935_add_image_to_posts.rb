class AddImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :text
  end
end
