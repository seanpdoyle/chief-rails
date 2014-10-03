module ConcernsHelper
  def described_model
    described_class.model_name.singular
  end
end

RSpec.configure do |config|
  config.include ConcernsHelper
end
