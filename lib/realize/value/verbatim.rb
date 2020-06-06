# frozen_string_literal: true

module Realize
  class Value
    # Default transformer that does nothing.
    class Verbatim
      acts_as_hashable

      # This is here to satisfy an underlying issue in acts_as_hashable.
      # The #make calls in the factory and hashable module should be calling #new with no
      # args if no keys are detected.
      def initialize(_opts = {}); end

      def transform(_resolver, value, _time, _record)
        value
      end
    end
  end
end
