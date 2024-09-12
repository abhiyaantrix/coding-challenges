# frozen_string_literal: true

require_relative '../../src/random_challenges/caesar_cipher'

describe CaesarCipher do
  subject(:caesar_cipher_creator) { ->(shift) { described_class.new(shift:) } }

  let(:shift) { 5 }
  let(:text) { 'UYOAW12W mog7Ub4OG ikM#4M laLlÖ89T' }
  let(:encrypted_text) { 'Z$TF"67"ertl<Zg9TLenpR(9ReqfQqÜ=>Y' }

  it 'encodes text' do
    expect(caesar_cipher_creator.call(shift).encode(text)).to eq(encrypted_text)
  end

  it 'decodes encrypted text' do
    expect(caesar_cipher_creator.call(shift).decode(encrypted_text)).to eq(text)
  end
end
