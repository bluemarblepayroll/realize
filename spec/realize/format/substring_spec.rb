# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Realize::Format::Substring do
  let(:resolver) { nil }
  let(:time)     { nil }

  describe '#transform' do
    context 'when cutting middle of a string' do
      let(:start_index) { 4 }
      let(:end_index)   { 6 }

      subject do
        described_class.new(
          start_index: start_index,
          end_index: end_index,
          exclusive: exclusive
        )
      end

      context 'inclusively' do
        let(:exclusive) { false }

        it 'cuts' do
          value    = '012-345-6789'
          expected = '345'

          expect(subject.transform(resolver, value, time, nil)).to eq(expected)
        end
      end

      context 'exclusively' do
        let(:exclusive) { true }

        it 'cuts' do
          value    = '012-345-6789'
          expected = '34'

          expect(subject.transform(resolver, value, time, nil)).to eq(expected)
        end
      end
    end

    context 'when start_index is not provided' do
      let(:end_index) { 6 }

      subject { described_class.new(end_index: end_index) }

      it 'cuts from beginning' do
        value    = '012-345-6789'
        expected = '012-345'

        expect(subject.transform(resolver, value, time, nil)).to eq(expected)
      end
    end

    context 'when end_index is not provided' do
      let(:start_index) { 4 }

      subject { described_class.new(start_index: start_index) }

      it 'cuts to end' do
        value    = '012-345-6789'
        expected = '345-6789'

        expect(subject.transform(resolver, value, time, nil)).to eq(expected)
      end
    end

    context 'when end_index is not greater than the length of the string' do
      let(:start_index) { 4 }
      let(:end_index)   { 9_999 }

      subject { described_class.new(end_index: end_index, start_index: start_index) }

      it 'cuts to the end' do
        value    = '012-345-6789'
        expected = '345-6789'

        expect(subject.transform(resolver, value, time, nil)).to eq(expected)
      end
    end
  end
end
