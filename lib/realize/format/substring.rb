# frozen_string_literal: true

module Realize
  class Format
    # Cut a string using a range (start and end index).  You can also choose whether you wish the
    # range selection to be inclusive (default) or exclusive.
    class Substring
      acts_as_hashable

      DEFAULT_END_INDEX   = -1
      DEFAULT_START_INDEX = 0

      attr_reader :end_index, :exclusive, :start_index

      def initialize(
        end_index: DEFAULT_END_INDEX,
        exclusive: false,
        start_index: DEFAULT_START_INDEX
      )
        @end_index   = end_index.to_i
        @exclusive   = exclusive || false
        @start_index = start_index.to_i

        freeze
      end

      def transform(_resolver, value, _time, _record)
        exclusive ? value.to_s[start_index...end_index] : value.to_s[start_index..end_index]
      end
    end
  end
end
