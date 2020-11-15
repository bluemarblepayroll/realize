# frozen_string_literal: true

#
# Copyright (c) 2020-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

module Realize
  class Type
    # Call #to_s.downcase on the value and return result.
    class UppercaseString
      acts_as_hashable

      attr_reader :nullable

      def initialize(nullable: false)
        @nullable = nullable || false
      end

      def transform(_resolver, value, _time, _record)
        return nil if nullable && value.nil?

        value.to_s.upcase
      end
    end
  end
end
