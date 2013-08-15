require 'spec_helper'

describe Spot, 'validations' do
  it { should validate_numericality_of(:lat).is_less_than_or_equal_to(90.0) }
  it { should validate_numericality_of(:lat).is_greater_than_or_equal_to(-90.0) }

  it { should validate_numericality_of(:lng).is_less_than_or_equal_to(180.0) }
  it { should validate_numericality_of(:lng).is_greater_than_or_equal_to(-180.0) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
end

describe Spot do
  [
    :name,
    :slug
  ].each do |message|
    it { should respond_to(message) }
  end
end
