# frozen_string_literal: true

require_relative '../../src/random_challenges/duplicate_zeros'

describe DuplicateZeros do
  subject(:duplicate_zeros) { ->(arr) { described_class.call(arr) } }

  context "when 0's in array" do
    let(:arr) { [0, 1, 2, 3, 0, 4, 5, 0] }
    let(:expected_result) { [0, 0, 1, 2, 3, 0, 0, 4] }

    it "transforms given array by duplicating all 0's" do
      expect { duplicate_zeros.call(arr) }.to change { arr }.from(arr).to(expected_result)
    end
  end

  context "when no 0's in array" do
    let(:arr) { [1, 2, 3, 4] }

    it 'does not change given array' do
      expect { duplicate_zeros.call(arr) }.not_to(change { arr })
    end
  end

  context 'when 0 only at the end of array' do
    let(:arr) { [1, 2, 0] }

    it 'does not change given array' do
      expect { duplicate_zeros.call(arr) }.not_to(change { arr })
    end
  end
end
