# frozen_string_literal: true

require_relative '../../update_handlers/aged_brie'
require_relative '../../item'

RSpec.describe UpdateHandlers::AgedBrie do
  subject { described_class.new(item).call }

  let(:item) { Item.new('aged_brie', sell_in, quality) }
  let(:sell_in) { 10 }
  let(:quality) { 20 }

  it 'lowers the sell in day by 1' do
    expect { subject }.to change { item.sell_in }.by(-1)
  end

  context 'when the quality is not yet max value' do
    it 'increases the quality by 1' do
      expect { subject }.to change { item.quality }.by(1)
    end
  end

  context 'when the quality reaches max value' do
    let(:quality) { 50 }

    it 'does not further increase to over the max vaule' do
      expect { subject }.not_to(change { item.quality })
    end
  end
end
