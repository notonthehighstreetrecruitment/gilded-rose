# frozen_string_literal: true

require_relative '../../update_handlers/default'
require_relative '../../item'

RSpec.describe UpdateHandlers::Default do
  subject { described_class.new(item).call }

  let(:item) { Item.new('default', sell_in, quality) }
  let(:sell_in) { 10 }
  let(:quality) { 20 }

  it 'lowers the sell in day by 1' do
    expect { subject }.to change { item.sell_in }.by(-1)
  end

  context 'when sell by date is not passed' do
    it 'lowers the quality by 1' do
      expect { subject }.to change { item.quality }.by(-1)
    end
  end

  context 'when sell by date is passed' do
    let(:sell_in) { 0 }

    it 'lowers the quality by 2' do
      expect { subject }.to change { item.quality }.by(-2)
    end
  end

  context 'when quality reaches zero' do
    let(:sell_in) { -1 }
    let(:quality) { 1 }

    it 'lowers the quality to zero but not nagative' do
      expect { subject }.to change { item.quality }.to(0)
    end
  end
end
