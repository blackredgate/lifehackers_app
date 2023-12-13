class ItemTag < ApplicationRecord
  belongs_to :item

  validates :itag_name, presence: true

   def self.looks(search, word)
    if search == "perfect_match"
      @item_tag = ItemTag.where("itag_name LIKE?", "#{word}")
    elsif search == "partial_match"
      @item_tag = ItemTag.where("itag_name LIKE?", "%#{word}%")
    else
      @item_tag = ItemTag.all
    end
   end
end
