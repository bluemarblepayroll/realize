# frozen_string_literal: true

module Realize
  # Main runner that encapsulates a collection of transformers and knows how to kick off the
  # transformation process.
  class Pipeline
    attr_reader :resolver, :transformers

    def initialize(resolver: Objectable.resolver, transformers: [])
      raise ArgumentError, 'resolver is required' unless resolver

      @resolver     = resolver
      @transformers = Transformers.array(transformers)

      freeze
    end

    def transform(record, opts = {})
      time  = opts.fetch(:time, Time.now.utc)
      value = opts.fetch(:value, record)

      transformers.inject(value) do |memo, transformer|
        transformer.transform(resolver, memo, time, record)
      end
    end
  end
end
