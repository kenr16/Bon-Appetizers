class Product < ActiveRecord::Base
  has_many :reviews
  has_many :associations
  has_many :tags, through: :associations

  has_attached_file :image,
                  styles: { thumb: ["100x100#", :jpg],
                            original: ['600x600>', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 100 -strip" }

  validates :name, :presence => true
  validates :name, :length => {
    :minimum => 3,
    :maximum => 50,
    :too_short => "%{count} characters is the minimum allowed for a name.",
    :too_long => "%{count} characters is the maximum allowed for a name."
  }

  validates :price, :presence => true

  validates :category, :presence => true

  validates :description, :presence => true
  validates :description, :length => {
    :minimum => 20,
    :maximum => 250,
    :too_short => "%{count} characters is the minimum allowed for a product description.",
    :too_long => "%{count} characters is the maximum allowed for a product description."
  }

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }



end
