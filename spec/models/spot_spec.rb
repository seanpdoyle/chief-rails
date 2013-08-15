require 'spec_helper'

describe Spot, 'validations' do
  it { should validate_presence_of(:name) }
end

describe Spot do
  [
    :name
  ].each do |message|
    it { should respond_to(message) }
  end
end
