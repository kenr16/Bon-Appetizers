class Product < ActiveRecord::Base
  include ActiveModel::Validations
  has_many :reviews

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

end
