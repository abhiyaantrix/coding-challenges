const minEatingSpeed = (piles: number[], hrs: number): number => {
  let minHrs = 1;
  let maxHrs = Math.max(...piles);

  while (minHrs < maxHrs) {
    const mid = Math.floor(minHrs + (maxHrs - minHrs) / 2);

    const hoursSpent = piles.reduce((sum, pile) => sum + Math.ceil(pile / mid), 0);

    if (hoursSpent <= hrs) {
      maxHrs = mid;
    } else {
      minHrs = mid + 1;
    }
  }

  return minHrs;
};

export default minEatingSpeed;
