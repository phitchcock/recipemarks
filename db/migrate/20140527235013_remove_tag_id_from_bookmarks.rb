class RemoveTagIdFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :tag_id
  end
end
