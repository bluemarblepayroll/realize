# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Realize::Value::Blank do
  let(:record)   { {} }
  let(:resolver) { nil }
  let(:time)     { nil }

  describe 'acts_as_hashable' do
    specify '#make hydrates without keys' do
      expect { described_class.make({}) }.not_to raise_error(ActsAsHashable::Hashable::HydrationError)
      expect { described_class.make({}) }.not_to raise_error(ArgumentError)
    end
  end

  describe '#transform' do
    it 'should return input' do
      value = 'something'

      expect(subject.transform(resolver, value, time, record)).to eq('')
    end
  end
end
