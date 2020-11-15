# frozen_string_literal: true

module Realize
  class Type
    # Call #to_s.downcase on the value and return result.
    class LowercaseString
      acts_as_hashable

      attr_reader :nullable

      def initialize(nullable: false)
        @nullable = nullable || false
      end

      def transform(_resolver, value, _time, _record)
        return nil if nullable && value.nil?

        value.to_s.downcase
      end
    end
  end
end
