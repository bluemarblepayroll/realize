# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Realize do
  let(:resolver) { Objectable.resolver }

  let(:transformers) do
    Realize::Transformers.array(
      type: 'r/value/resolve',
      key: :name
    )
  end

  specify '#pipeline returns new instance of Pipeline' do
    actual = described_class.pipeline(resolver: resolver, transformers: transformers)

    expect(actual).to              be_an_instance_of(Realize::Pipeline)
    expect(actual.resolver).to     eql(resolver)
    expect(actual.transformers).to eql(transformers)
  end
end
