# frozen_string_literal: true

require_relative '../../update_handlers/sulfuras'
require_relative '../../item'

RSpec.describe UpdateHandlers::Sulfuras do
  subject { described_class.new(item).call }

  let(:item) { Item.new('sulfuras', sell_in, quality) }
  let(:sell_in) { 10 }
  let(:quality) { 80 }

  it 'does not alter the sell in and quality' do
    expect { subject }.not_to(change { [item.sell_in, item.quality] })
  end
end
