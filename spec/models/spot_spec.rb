require 'spec_helper'

describe Spot, 'validations' do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

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
