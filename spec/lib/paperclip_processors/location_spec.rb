require 'spec_helper'

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
      expect(model).not_to receive(:lat=)
      expect(model).not_to receive(:lng=)
    end
  end
end