# frozen_string_literal: true

require_relative '../../src/random_challenges/round_to_nearest_multiple'

describe RoundToNearestMultiple do
  subject(:round_to_nearest_multiple) { ->(multiple) { described_class.new(multiple) } }

  let(:multiple) { 5 }

  context 'with positive number' do
    let(:num) { 16 }
    let(:num_closer_to_floor) { 18 }
    let(:num_closer_to_ceil) { 17 }

    let(:expected_round_up_num) { 20 }
    let(:expected_round_down_num) { 15 }

    it 'rounds up the number' do
      expect(round_to_nearest_multiple.call(multiple).up(num)).to eq(expected_round_up_num)
    end

    it 'rounds down the number' do
      expect(round_to_nearest_multiple.call(multiple).down(num)).to eq(expected_round_down_num)
    end

    it 'auto rounds up the number' do
      expect(round_to_nearest_multiple.call(multiple).auto(num_closer_to_floor)).to eq(expected_round_up_num)
    end

    it 'auto rounds down the number' do
      expect(round_to_nearest_multiple.call(multiple).auto(num_closer_to_ceil)).to eq(expected_round_down_num)
    end
  end

  context 'with negative number' do
    let(:num) { -16 }
    let(:num_closer_to_floor) { -17 }
    let(:num_closer_to_ceil) { -18 }

    let(:expected_round_up_num) { -15 }
    let(:expected_round_down_num) { -20 }

    it 'rounds up the number' do
      expect(round_to_nearest_multiple.call(multiple).up(num)).to eq(expected_round_up_num)
    end

    it 'rounds down the number' do
      expect(round_to_nearest_multiple.call(multiple).down(num)).to eq(expected_round_down_num)
    end

    it 'auto rounds up the number' do
      expect(round_to_nearest_multiple.call(multiple).auto(num_closer_to_floor)).to eq(expected_round_up_num)
    end

    it 'auto rounds down the number' do
      expect(round_to_nearest_multiple.call(multiple).auto(num_closer_to_ceil)).to eq(expected_round_down_num)
    end
  end

  context 'when already in multiple' do
    let(:positive_num) { 10 }
    let(:negative_num) { -20 }

    it 'returns same positive number' do
      expect(round_to_nearest_multiple.call(multiple).auto(positive_num)).to eq(positive_num)
    end

    it 'returns same negative number' do
      expect(round_to_nearest_multiple.call(multiple).auto(negative_num)).to eq(negative_num)
    end
  end
end
