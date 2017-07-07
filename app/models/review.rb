class Review < ActiveRecord::Base

  belongs_to :product, foreign_key: :product_id, optional: true
  # foreign_key specifies the foreign key name in the database.

  validates :author, :presence => true

  validates :rating, :presence => true
  validates :rating, :numericality => {
    :only_integer => true,
    :greater_than => 0,
    :less_than => 11,
    # Default error messages exist for these values.
  }

  validates :content, :presence => true
  validates :content, :length => {
    :minimum => 10,
    :maximum => 250,
    :too_short => "%{count} characters is the minimum allowed for this review",
    :too_long => "%{count} characters is the maximum allowed for this review"
  }

end
