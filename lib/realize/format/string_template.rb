# frozen_string_literal: true

module Realize
  class Format
    # Use an expression as a template and string interpolate it using the Stringento library.
    # Stringento also uses Objectable to provide (optional) key-path notation for handling
    # nested objects.
    # For more information see underlying libraries:
    #   * Stringento: https://github.com/bluemarblepayroll/stringento
    #   * Objectable: https://github.com/bluemarblepayroll/objectable
    class StringTemplate
      acts_as_hashable

      attr_reader :expression, :resolver, :use_record

      def initialize(expression: '', separator: '', use_record: false)
        @expression = expression.to_s
        @resolver   = Objectable.resolver(separator: separator)
        @use_record = use_record || false

        freeze
      end

      def transform(_resolver, value, _time, record)
        input = use_record ? record : value

        Stringento.evaluate(expression, input, resolver: self)
      end

      # For Stringento consumption
      def resolve(value, input)
        resolver.get(input, value)
      end
    end
  end
end
