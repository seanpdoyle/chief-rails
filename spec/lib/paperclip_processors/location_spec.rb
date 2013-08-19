require 'spec_helper'

def does_nothing(model)
  %i(lat? lng?).each do |field|
    expect(model).not_to receive(field)
  end
end

describe Location do
  subject { described_class.new nil }
  it { should be_a Paperclip::Processor }
end

describe Location, '#make' do
  let(:model) { double :model }
  let(:attachment) { double :attachment, instance: model }
  subject { described_class.new(file, {}, attachment) }

  it "returns the original file, unmodified" do
    file = File.new(Photos::WITHOUT_EXIF.path)
    expect(described_class.new(file).make).to be file
  end

  context "when the model's location is locked" do
    let(:file){ File.new(Photos::WITH_EXIF.path) }
    
    before do
      expect(model).to receive(:location_locked?) { true }
    end

    after do
      subject.make
    end

    it 'does not modify the Attachment model' do
      does_nothing(model)
    end
  end

  context "when the model's location is not locked" do
    before do
      expect(model).to receive(:location_locked?) { false }
    end

    context 'given a file with EXIF GPS data' do
      let(:file){ File.new(Photos::WITH_EXIF.path) }

      after do
        subject.make
      end

      it "sets the `lat` and `lng` on the Attachment's model" do
        expect(model).to receive(:lat=).with(Photos::WITH_EXIF.lat)
        expect(model).to receive(:lng=).with(Photos::WITH_EXIF.lng)
      end
    end

    context 'given a file without EXIF' do
      let(:file){ File.new(Photos::WITHOUT_EXIF.path) }

      after do
        subject.make
      end

      it 'does not modify the Attachment model' do
        does_nothing(model)
      end
    end
  end
end