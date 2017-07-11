class Tag < ActiveRecord::Base
  has_many :associations
  has_many :Products, through: :associations

end
