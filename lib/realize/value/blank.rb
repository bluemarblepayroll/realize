# frozen_string_literal: true

module Realize
  class Value
    # Always returns blank string
    class Blank
      acts_as_hashable

      def initialize(_opts = {}); end

      def transform(_resolver, _value, _time, _record)
        ''
      end
    end
  end
end
