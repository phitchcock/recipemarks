class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
  
  has_many :bookmarks

  validates :name, presence: true

  default_scope {order('created_at DESC')}
end