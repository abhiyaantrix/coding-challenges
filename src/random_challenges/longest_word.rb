# frozen_string_literal: true

# Find the longest word in a sentence or a collection of words
# Example:
#   LongestWord.new.in_sentence('The quick brown fox jumps over the lazy dog')
#   => 'quick'
class LongestWord

  DEFAULT_SEPARATOR = ' '

  private_constant :DEFAULT_SEPARATOR

  def in_sentence(str, separator = DEFAULT_SEPARATOR)
    list = str.split(separator)

    find_longest_word(list)
  end

  def in_collection(list)
    find_longest_word(list)
  end

  private

  def find_longest_word(arr)
    arr.max_by(&:length)
  end

end
