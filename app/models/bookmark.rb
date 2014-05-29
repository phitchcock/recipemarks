class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history

  acts_as_taggable_on :tags


  #belongs_to :topic
  belongs_to :user
  
  
  validates :name, presence: true, length: {minimum: 1}
  validates :user, presence: true
  validates :url, length: {minimum: 1}

  default_scope {order('created_at DESC')}
end