require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :category }
  it { should validate_presence_of :price }
end
