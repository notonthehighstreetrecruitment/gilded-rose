# frozen_string_literal: true

require_relative '../../update_handlers/backstate_passes'
require_relative '../../item'

RSpec.describe UpdateHandlers::BackstagePasses do
  subject { described_class.new(item).call }

  let(:item) { Item.new('backstate_passes', sell_in, quality) }
  let(:sell_in) { 10 }
  let(:quality) { 20 }

  it 'lowers the sell in day by 1' do
    expect { subject }.to change { item.sell_in }.by(-1)
  end

  context 'when the sell in is more than 10 days' do
    let(:sell_in) { 11 }

    it 'increases the quality by 1' do
      expect { subject }.to change { item.quality }.by(1)
    end
  end

  context 'when the sell in is between 6 and 10 days' do
    (6..10).each do |sell_in_days|
      context "when the sell in is #{sell_in_days}" do
        let(:sell_in) { sell_in_days }

        it 'increases the quality by 2' do
          expect { subject }.to change { item.quality }.by(2)
        end
      end
    end
  end

  context 'when the sell in is between 1 and 5 days' do
    (1..5).each do |sell_in_days|
      context "when the sell in is #{sell_in_days}" do
        let(:sell_in) { sell_in_days }

        it 'increases the quality by 3' do
          expect { subject }.to change { item.quality }.by(3)
        end
      end
    end
  end

  context 'when the sell by day is passed' do
    let(:sell_in) { 0 }

    it 'drops the quality to zero' do
      expect { subject }.to change { item.quality }.to(0)
    end
  end

  context 'when the quality reaches 50' do
    let(:sell_in) { 2 }
    let(:quality) { 49 }

    it 'does not further increase to over 50' do
      expect { subject }.to change { item.quality }.to(50)
    end
  end
end
