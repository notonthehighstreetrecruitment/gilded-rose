# frozen_string_literal: true

Dir[File.expand_path('update_handlers/*.rb', __dir__)].each do |file|
  require_relative file
end

class GildedRose
  UPDATE_HANDLERS = {
    'Aged Brie' => UpdateHandlers::AgedBrie,
    'Sulfuras, Hand of Ragnaros' => UpdateHandlers::Sulfuras,
    'Backstage passes to a TAFKAL80ETC concert' => UpdateHandlers::BackstagePasses,
    'Conjured Mana Cake' => UpdateHandlers::Conjured
  }.freeze

  private_constant :UPDATE_HANDLERS

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each { |item| update_item(item) }
  end

  private

  attr_reader :items

  def update_item(item)
    handler_class = UPDATE_HANDLERS[item.name] || UpdateHandlers::Default

    handler_class.new(item).call
  end
end
