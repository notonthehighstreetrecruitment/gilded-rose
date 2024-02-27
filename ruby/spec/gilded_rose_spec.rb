# frozen_string_literal: true

require_relative '../gilded_rose'
require_relative '../item'

RSpec.describe GildedRose do
  let(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    subject { gilded_rose.update_quality }
    let(:items) { [item] }
    let(:item) { Item.new('foo', 0, 0) }

    it 'does not change the name' do
      subject

      expect(item.name).to eq 'foo'
    end

    shared_examples 'lowers the sell in day by 1' do
      it do
        expect { subject }.to change { item.sell_in }.by(-1)
      end
    end

    context 'when the item is not special type' do
      it_behaves_like 'lowers the sell in day by 1'

      context 'when sell in and quality are positive' do
        let(:item) { Item.new('foo', 2, 3) }

        it 'lowers the quality by 1' do
          expect { subject }.to change { item.quality }.by(-1)
        end
      end

      context 'when the sell by date is passed' do
        let(:item) { Item.new('foo', 0, 3) }

        it 'lowers the quality by 2' do
          expect { subject }.to change { item.quality }.by(-2)
        end
      end

      context 'when the quality is reaching zero' do
        let(:item) { Item.new('foo', 0, 1) }

        it 'lowers the quality to zero but not negative' do
          expect { subject }.to change { item.quality }.to(0)
        end
      end
    end

    context 'when the item is Aged Brie' do
      let(:item) { Item.new('Aged Brie', 2, 3) }

      it_behaves_like 'lowers the sell in day by 1'

      it 'increases the quality by 1' do
        expect { subject }.to change { item.quality }.by(1)
      end

      context 'when the quality reaches 50' do
        let(:item) { Item.new('Aged Brie', 2, 50) }

        it 'does not further increase to over 50' do
          expect { subject }.not_to(change { item.quality })
        end
      end
    end

    context 'when the item is Sulfuras' do
      let(:item) { Item.new('Sulfuras, Hand of Ragnaros', 2, 80) }

      it 'does not alter the sell in and quality' do
        expect { subject }.not_to(change { [item.sell_in, item.quality] })
      end
    end

    context 'when the item is Backstage passes' do
      it_behaves_like 'lowers the sell in day by 1'

      context 'when the sell in is more than 10 days' do
        let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10) }

        it 'increases the quality by 1' do
          expect { subject }.to change { item.quality }.by(1)
        end
      end

      context 'when the sell in is between 6 and 10 days' do
        (6..10).each do |sell_in_days|
          context "when the sell in is #{sell_in_days}" do
            let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', sell_in_days, 10) }

            it 'increases the quality by 2' do
              expect { subject }.to change { item.quality }.by(2)
            end
          end
        end
      end

      context 'when the sell in is between 1 and 5 days' do
        (1..5).each do |sell_in_days|
          context "when the sell in is #{sell_in_days}" do
            let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', sell_in_days, 10) }

            it 'increases the quality by 3' do
              expect { subject }.to change { item.quality }.by(3)
            end
          end
        end
      end

      context 'when the sell by day is passed' do
        let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10) }

        it 'drops the quality to zero' do
          expect { subject }.to change { item.quality }.to(0)
        end
      end

      context 'when the quality reaches 50' do
        let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 49) }

        it 'does not further increase to over 50' do
          expect { subject }.to change { item.quality }.to(50)
        end
      end
    end

    context 'when the item is Conjured' do
      it_behaves_like 'lowers the sell in day by 1'

      context 'when sell in and quality are positive' do
        let(:item) { Item.new('Conjured Mana Cake', 2, 5) }

        it 'lowers the quality by 2' do
          expect { subject }.to change { item.quality }.by(-2)
        end
      end

      context 'when the sell by date is passed' do
        let(:item) { Item.new('Conjured Mana Cake', 0, 5) }

        it 'lowers the quality by 4' do
          expect { subject }.to change { item.quality }.by(-4)
        end
      end

      context 'when the quality is reaching zero' do
        let(:item) { Item.new('Conjured Mana Cake', 0, 1) }

        it 'lowers the quality to zero but not negative' do
          expect { subject }.to change { item.quality }.to(0)
        end
      end
    end

    context 'when there are multiple items' do
      let(:items) { [item_one, item_two, item_three, item_four] }
      let(:item_one) { Item.new('foo', 0, 3) }
      let(:item_two) { Item.new('Aged Brie', 2, 3) }
      let(:item_three) { Item.new('Sulfuras, Hand of Ragnaros', 2, 80) }
      let(:item_four) { Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10) }

      it 'updates the sell_ins and qualities of items accordingly' do
        subject

        expect(item_one).to have_attributes(sell_in: -1, quality: 1)
        expect(item_two).to have_attributes(sell_in: 1, quality: 4)
        expect(item_three).to have_attributes(sell_in: 2, quality: 80)
        expect(item_four).to have_attributes(sell_in: 10, quality: 11)
      end
    end
  end
end
