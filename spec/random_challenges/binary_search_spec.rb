# frozen_string_literal: true

require_relative '../../src/random_challenges/binary_search'

describe BinarySearch do
  subject(:binary_search) { ->(array) { described_class.new(array) } }

  let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  shared_examples 'binary search' do |method|
    context 'when number in array' do
      [1, 2, 3, 4, 5, 6, 7, 8, 9].each do |num|
        it "returns correct index for #{num} in sorted array using #{method}" do
          expected_index = num - 1

          search = binary_search.call(array)
          expect(search.send(method, num)).to eq(expected_index)
        end
      end
    end

    context 'when number not in array' do
      [0, 10, 15, 18, 27, 32].each do |num|
        it "returns -1 for #{num} as it is not in array using #{method}" do
          search = binary_search.call(array)

          expect(search.send(method, num)).to eq(-1)
        end
      end
    end
  end

  context 'with iteration' do
    it_behaves_like 'binary search', :search_by_iteration
  end

  context 'with recursion' do
    it_behaves_like 'binary search', :search_by_recursion
  end

  context 'when duplicates' do
    let(:array_with_duplicates) { [1, 2, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9] }

    %i[search_by_iteration search_by_recursion].each do |method|
      context "with #{method}" do
        it 'returns index of first occurrence of number in array' do
          expected_index = 3
          target = 4

          search = binary_search.call(array_with_duplicates)

          expect(search.send(method, target)).to eq(expected_index)
        end

        it 'returns index of last occurrence of number in array' do
          expected_index = 9
          target = 7

          search = binary_search.call(array_with_duplicates)

          expect(search.send(method, target, occurrence: :last)).to eq(expected_index)
        end
      end
    end

    context 'when counting all occurrences in array' do
      let(:array_with_duplicates) { [1, 2, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9] }
      let(:search) { binary_search.call(array_with_duplicates) }

      [
        { target: 10, expected_count: 0 },
        { target: 6, expected_count: 1 },
        { target: 4, expected_count: 2 },
        { target: 7, expected_count: 3 }
      ].each do |test_case|
        test_case => { target:, expected_count: }

        it "returns #{expected_count} for number #{target}" do
          expect(search.count_all_occurrences(target)).to eq(expected_count)
        end
      end
    end
  end
end
