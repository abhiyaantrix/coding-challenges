# frozen_string_literal: true

# Flattens a nested hash
# Example:
#   hash = { a: 1, b: { c: 2, d: { e: 3 } } }
#   DeepFlattenHash.new.call(hash)
#   => { a: 1, b_c: 2, b_d_e: 3 }
class DeepFlattenHash

  def call(hash)
    Hash[*flatten_hash(hash)]
  end

  private

  def flatten_hash(hash, key = nil)
    hash.flat_map do |inner_key, value|
      composed_key = key ? "#{key}_#{inner_key}" : inner_key.to_s

      value.is_a?(Hash) ? flatten_hash(value, composed_key) : [composed_key.to_sym, value]
    end
  end

end
