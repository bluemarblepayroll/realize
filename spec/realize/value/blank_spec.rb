# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Realize::Value::Blank do
  let(:record)   { {} }
  let(:resolver) { nil }
  let(:time)     { nil }

  describe '#transform' do
    it 'should return input' do
      value = 'something'

      expect(subject.transform(resolver, value, time, record)).to eq('')
    end
  end
end
