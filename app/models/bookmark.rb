class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history

  belongs_to :topic
  belongs_to :user
  
  validates :name, presence: true

  # default_scope {order('created_at DESC')}
end