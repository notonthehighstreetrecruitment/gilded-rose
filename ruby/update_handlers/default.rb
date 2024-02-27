# frozen_string_literal: true

require_relative 'base'

module UpdateHandlers
  class Default < Base
    private

    def update_sell_in
      item.sell_in -= 1
    end

    def update_quality
      quality_value = sell_in.negative? ? quality - 2 : quality - 1

      item.quality = normalise(quality_value)
    end
  end
end
