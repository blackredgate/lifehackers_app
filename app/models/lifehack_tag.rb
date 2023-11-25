class LifehackTag < ApplicationRecord
  belongs_to :lifehack

  validates :ltag_name, presence: true
  
  def self.looks(search, word)
    if search == "perfect_match"
      @lifehack_tag = LifehackTag.where("ltag_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @lifehack_tag = LifehackTag.where("ltag_name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @lifehack_tag = LifehackTag.where("ltag_name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @lifehack_tag = LifehackTag.where("ltag_name LIKE?", "%#{word}%")
    else
      @lifehack_tag = LifehackTag.all
    end
  end
end
