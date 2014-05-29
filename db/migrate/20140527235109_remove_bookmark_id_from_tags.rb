class RemoveBookmarkIdFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :bookmark_id
  end
end
