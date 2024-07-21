# frozen_string_literal: true

# Round a number to nearest value of given multiple
# For simplicity only supports integer input
# Example:
#   rounder = RoundToNearestMultiple.new(5)
#   rounder.up(12) => 15
#   rounder.down(12) => 10
#   rounder.auto(12) => 10
class RoundToNearestMultiple

  def initialize(multiple)
    @multiple = multiple
  end

  def up(num)
    return num if already_in_multiple?(num)

    return round_up_negative_number(num) if num.negative?

    round_up_positive_number(num)
  end

  def down(num)
    return num if already_in_multiple?(num)

    return round_down_negative_number(num) if num.negative?

    round_down_positive_number(num)
  end

  # Auto round either up or down within the nearest two multiples
  def auto(num)
    return num if already_in_multiple?(num)

    auto_round(num)
  end

  private

  attr_reader :multiple

  def already_in_multiple?(num)
    @already_in_multiple ||= (num.abs % multiple).zero?
  end

  def round_up_positive_number(num)
    (num - 1) + multiple - ((num - 1) % multiple)
  end

  def round_down_positive_number(num)
    (num / multiple) * multiple
  end

  def round_up_negative_number(num)
    -round_down_positive_number(num.abs)
  end

  def round_down_negative_number(num)
    -round_up_positive_number(num.abs)
  end

  def auto_round(num)
    ((num + (multiple / 2)) / multiple) * multiple
  end

end
