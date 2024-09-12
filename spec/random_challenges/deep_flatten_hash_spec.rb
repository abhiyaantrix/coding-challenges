# frozen_string_literal: true

require_relative '../../src/random_challenges/deep_flatten_hash'

describe DeepFlattenHash do
  subject(:deep_flatten_hash) { ->(hash) { described_class.new.call(hash) } }

  context 'when non nested hash' do
    let(:hash) { { a: 'foo', b: 'bar', c: 'baz' } }

    it 'returns the same hash' do
      expect(deep_flatten_hash.call(hash)).to eq(hash)
    end
  end

  context 'when nested hash' do
    let(:hash) { { a: 'foo', b: 'bar', c: { d: 'baz' } } }
    let(:expected_flattened_hash) { { a: 'foo', b: 'bar', c_d: 'baz' } }

    it 'flattens nested hash with composed keys' do
      expect(deep_flatten_hash.call(hash)).to eq(expected_flattened_hash)
    end
  end

  context 'when deeply nested hash' do
    let(:hash) { { a: { b: { c: 42, d: 'foo' }, d: 'bar' }, e: 'baz', f: { b: { a: [1, 2, 3] } } } }
    let(:expected_flattened_hash) { { a_b_c: 42, a_b_d: 'foo', a_d: 'bar', e: 'baz', f_b_a: [1, 2, 3] } }

    it 'flattens deeply nested hash with composed keys' do
      expect(deep_flatten_hash.call(hash)).to eq(expected_flattened_hash)
    end
  end
end
