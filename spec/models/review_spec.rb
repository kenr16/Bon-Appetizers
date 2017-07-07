require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }
  it { should belong_to :product }

  it { should have_db_column :product_id }
  it { should validate_numericality_of :rating }
  it { should validate_length_of :content }

end
