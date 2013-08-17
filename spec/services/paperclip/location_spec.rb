require 'spec_helper'

describe Paperclip::Location do
  subject { described_class.new nil }
  it { should be_a Paperclip::Processor }
end

describe Paperclip::Location, '#make' do
  let(:model) { double :model }
  subject { described_class.new(file, {}, model) }

  it "returns the original file, unmodified" do
    file = File.open(Photos::WITHOUT_EXIF.path)
    expect(described_class.new(file).make).to be file
  end

  context 'given a file with EXIF GPS data' do
    let(:file){ File.open(Photos::WITH_EXIF.path) }

    it "updates the `lat` & `lng` attributes on the Attachment's model" do
      arguments = {
        lat: Photos::WITH_EXIF.lat,
        lng: Photos::WITH_EXIF.lng
      }

      expect(model).to receive(:update!).with(arguments)

      subject.make
    end
  end

  context 'given a file without EXIF' do
    let(:file){ File.open(Photos::WITHOUT_EXIF.path) }

    it 'does not modify the Attachment model' do
      expect(model).not_to receive(:update!)

      subject.make
    end
  end
end