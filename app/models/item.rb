class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :item_favorites, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  accepts_nested_attributes_for :item_tags, allow_destroy: true

  validates :item_title, presence: true
  validates :item_body, presence: true
  validates :image, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def item_favorited_by?(user)
    item_favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("item_title LIKE?", "#{word}")
    elsif search == "partial_match"
      @item = Item.where("item_body LIKE?", "%#{word}%")
    else
      @item = Item.all
    end
  end
end
