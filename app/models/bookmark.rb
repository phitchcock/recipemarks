class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :name, presence: true
end