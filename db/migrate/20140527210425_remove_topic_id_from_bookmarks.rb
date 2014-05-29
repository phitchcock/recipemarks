class RemoveTopicIdFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :topic_id
  end
end
