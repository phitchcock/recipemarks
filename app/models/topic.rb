class Topic < ActiveRecord::Base
  has_many :bookmarks

  validates :name, presence: true

  default_scope {order('created_at DESC')}
end