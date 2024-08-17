# frozen_string_literal: true

# @param {Integer[]} piles
# @param {Integer} hrs
# @return {Integer}
def min_eating_speed(piles, hrs)
  min_hrs = 1
  max_hrs = piles.max

  while min_hrs < max_hrs
    mid = min_hrs + ((max_hrs - min_hrs) / 2)

    hours_spent = piles.sum { |pile| (pile / mid.to_f).ceil }

    if hours_spent <= hrs
      max_hrs = mid
    else
      min_hrs = mid + 1
    end
  end

  min_hrs # at the end of while, min == max
end
