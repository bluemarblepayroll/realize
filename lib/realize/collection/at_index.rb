# frozen_string_literal: true

module Realize
  class Collection
    # Transformer to get an item of a collection
    class AtIndex
      acts_as_hashable

      attr_reader :index

      def initialize(index:)
        raise ArgumentError, 'integer index is required' unless index.is_a?(Integer)

        @index = index

        freeze
      end

      def transform(_resolver, value, _time, _record)
        at_index(value, index)
      end

      private

      def at_index(value, index)
        value.is_a?(Array) ? value[index] : value
      end
    end
  end
end
