# frozen_string_literal: true

require_relative 'collection/sort'

require_relative 'filter/by_key_record_value'
require_relative 'filter/by_key_value'
require_relative 'filter/by_key_value_presence'
require_relative 'filter/inactive'

require_relative 'format/date'
require_relative 'format/remove_whitespace'
require_relative 'format/string_replace'

require_relative 'logical/switch'

require_relative 'value/blank'
require_relative 'value/map'
require_relative 'value/resolve'
require_relative 'value/verbatim'

module Realize
  # Transformers for building individual transformation step objects.  Used like this:
  # Transformers.make(type: '')
  # Transformers.make(type: 'map')
  # etc...
  class Transformers
    acts_as_hashable_factory

    # Default
    register '',                             Value::Verbatim

    register 'collection/sort',              Collection::Sort

    register 'filter/by_key_record_value',   Filter::ByKeyRecordValue
    register 'filter/by_key_value',          Filter::ByKeyValue
    register 'filter/by_key_value_presence', Filter::ByKeyValuePresence
    register 'filter/inactive',              Filter::Inactive

    register 'format/date',                  Format::Date
    register 'format/remove_whitespace',     Format::RemoveWhitespace
    register 'format/string_replace',        Format::StringReplace

    register 'logical/switch',               Logical::Switch

    register 'value/blank',                  Value::Blank
    register 'value/map',                    Value::Map
    register 'value/resolve',                Value::Resolve
    register 'value/verbatim',               Value::Verbatim
  end
end
