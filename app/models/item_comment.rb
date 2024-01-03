class ItemComment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  validates :item_comment, presence: true
end
