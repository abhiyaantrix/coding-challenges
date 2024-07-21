# frozen_string_literal: true

# A simple Caesar cipher implementation
# - shift: the number of positions to shift the letters
# - encode: encodes the given text
# - decode: decodes the given encoded text
# Example:
#   cipher = CaesarCipher.new(shift: 3)
#   cipher.encode('Hello, World!')
#   => 'Khoor, Zruog!'
#   cipher.decode('Khoor, Zruog!')
#   => 'Hello, World!'
class CaesarCipher

  def initialize(shift: 1)
    @shift = shift
  end

  def encode(text)
    text.chars.map { |ch| encoder.fetch(ch) }.join
  end

  def decode(encoded_text)
    encoded_text.chars.map { |ch| decoder.fetch(ch) }.join
  end

  private

  attr_reader :shift

  def encoder
    @encoder ||= letters.zip(letters.rotate(shift)).to_h
  end

  def decoder
    @decoder ||= letters.rotate(shift).zip(letters).to_h
  end

  def letters
    @letters ||= [*('a'..'z'), *('A'..'Z'), *('!'..'?'), *('µ'..'ö'), ' ']
  end

end
