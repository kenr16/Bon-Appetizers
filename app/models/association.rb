class Association < ActiveRecord::Base
  belongs_to :product, foreign_key: :product_id
  belongs_to :tag, foreign_key: :tag_id
  # foreign_key specifies the foreign key name in the database.
end
