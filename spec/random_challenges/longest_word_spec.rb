# frozen_string_literal: true

require_relative '../../src/random_challenges/longest_word'

describe LongestWord do
  subject(:longest_word_calculator) { described_class.new }

  let(:expected_longest_word) { 'architecto' }

  context 'when sentence' do
    let(:sentence) { 'Nobis autem est architecto' }

    it 'finds longest word' do
      expect(longest_word_calculator.in_sentence(sentence)).to eq(expected_longest_word)
    end
  end

  context 'when sentence with custom separator' do
    let(:sentence) { 'Nobis_autem_est_architecto' }
    let(:separator) { '_' }

    it 'finds longest word' do
      expect(longest_word_calculator.in_sentence(sentence, separator)).to eq(expected_longest_word)
    end
  end

  context 'when collection of words' do
    let(:words) { %w[Nobis autem est architecto] }

    it 'finds longest word' do
      expect(longest_word_calculator.in_collection(words)).to eq(expected_longest_word)
    end
  end
end
