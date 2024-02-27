# frozen_string_literal: true

require_relative 'base'

module UpdateHandlers
  class BackstagePasses < Base
    private

    def update_sell_in
      item.sell_in -= 1
    end

    def update_quality
      quality_value = caculated_quality

      item.quality = normalise(quality_value)
    end

    def caculated_quality
      if sell_in >= 10
        quality + 1
      elsif sell_in >= 5 && sell_in < 10
        quality + 2
      elsif sell_in >= 0 && sell_in < 5
        quality + 3
      else
        0
      end
    end
  end
end
