# frozen_string_literal: true

require_relative '../item'

RSpec.describe Item do
  subject(:item) { described_class.new(name, sell_in, quality) }

  let(:name) { 'foo' }
  let(:sell_in) { 10 }
  let(:quality) { 20 }

  it 'has attributes of name, sell_in and quality' do
    expect(subject).to have_attributes(name: 'foo', sell_in: 10, quality: 20)
  end

  it 'has setter for name' do
    subject.name = 'bar'

    expect(subject.name).to eq 'bar'
  end

  it 'has setter for sell_in' do
    subject.sell_in = 0

    expect(subject.sell_in).to eq 0
  end

  it 'has setter for quality' do
    subject.quality = 0

    expect(subject.quality).to eq 0
  end

  describe '#to_s' do
    it 'returns formatted string containing name, sell_in and quality' do
      expect(subject.to_s).to eq 'foo, 10, 20'
    end
  end
end
