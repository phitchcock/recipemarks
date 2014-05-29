class AddTagIdToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :tag_id, :integer
    add_index :bookmarks, :tag_id
  end
end
