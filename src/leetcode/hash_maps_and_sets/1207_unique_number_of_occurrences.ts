const uniqueOccurrences = (arr: number[]): boolean => {
  const hashMap = arr.reduce((acc, item) => acc.set(item, (acc.get(item) ?? 0) + 1), new Map<number, number>());

  return hashMap.size === new Set(hashMap.values()).size;
};

export default uniqueOccurrences;
