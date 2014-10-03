describe Spot do
  it_behaves_like :locatable

  it { should have_many(:images).dependent(:destroy) }
end
