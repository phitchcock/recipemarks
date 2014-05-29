class AddBookmarkIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :bookmark_id, :integer
    add_index :tags, :bookmark_id
  end
end
