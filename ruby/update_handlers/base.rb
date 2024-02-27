# frozen_string_literal: true

module UpdateHandlers
  class Base
    MAX_QUALITY = 50
    MIN_QUALITY = 0

    private_constant :MAX_QUALITY, :MIN_QUALITY

    def initialize(item)
      @item = item
    end

    def call
      update_sell_in
      update_quality
    end

    private

    attr_reader :item

    def update_sell_in
      raise NotImplementedError
    end

    def update_quality
      raise NotImplementedError
    end

    def normalise(quality_value)
      return MAX_QUALITY if quality_value > MAX_QUALITY

      return MIN_QUALITY if quality_value < MIN_QUALITY

      quality_value
    end

    def sell_in
      item.sell_in
    end

    def quality
      item.quality
    end
  end
end
