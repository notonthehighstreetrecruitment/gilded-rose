# frozen_string_literal: true

require_relative 'base'

module UpdateHandlers
  class Sulfuras < Base
    private

    def update_sell_in
      sell_in
    end

    def update_quality
      quality
    end
  end
end
