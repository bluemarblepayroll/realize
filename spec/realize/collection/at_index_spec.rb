# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Realize::Collection::AtIndex do
  let(:resolver) { Objectable.resolver }

  let(:first_object) do
    {
      'id': 1,
      'name': 'apple'
    }
  end

  let(:second_object) do
    {
      'id': 2,
      'name': 'orange'
    }
  end

  let(:third_object) do
    {
      'id': 3,
      'name': 'banana'
    }
  end

  let(:value) { [first_object, second_object, third_object] }

  describe '#transform' do
    context 'at_index' do
      it 'when value is an array' do
        transformer = described_class.new(index: 0)
        expect(transformer.transform(resolver, value, nil, nil)).to eq(first_object)
      end
      it 'when value is not an array' do
        transformer = described_class.new(index: 0)
        expect(transformer.transform(resolver, { "id": 12, "date": '2020-01-01' }, nil, nil))
          .to eq("id": 12, "date": '2020-01-01')
      end
      it 'returns nil for an empty array' do
        transformer = described_class.new(index: 0)
        expect(transformer.transform(resolver, [], nil, nil)).to eq(nil)
      end
      it 'returns item for given index' do
        transformer = described_class.new(index: 1)
        expect(transformer.transform(resolver, value, nil, nil)).to eq(second_object)
        transformer = described_class.new(index: 2)
        expect(transformer.transform(resolver, value, nil, nil)).to eq(third_object)
      end
      it 'returns item for negitive index' do
        transformer = described_class.new(index: -1)
        expect(transformer.transform(resolver, value, nil, nil)).to eq(third_object)
        transformer = described_class.new(index: -2)
        expect(transformer.transform(resolver, value, nil, nil)).to eq(second_object)
      end
      it 'returns nil for index out of range' do
        transformer = described_class.new(index: 10)
        expect(transformer.transform(resolver, value, nil, nil)).to eq(nil)
      end
    end

    context 'exceptions' do
      it 'throws exception for nil index' do
        expect { described_class.new(index: nil) }.to raise_error('integer index is required')
      end

      it 'thows an exception for bad index' do
        expect { described_class.new(index: 'bananas') }.to raise_error('integer index is required')
      end
    end
  end
end
