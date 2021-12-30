function convertToRoman(num) {
  const romanNumerals = {
    1: 'I',
    4: 'IV',
    5: 'V',
    9: 'IX',
    10:'X',
    40: 'XL',
    50: 'L',
    90: 'XC',
    100: 'C',
    400: 'CD',
    500: 'D',
    900: 'CM',
    1000: 'M' 
  }
  const basisNum = Object.keys(romanNumerals).map(num => Number(num)).sort((a,b) => b - a);
  let reducedNum = num
  let numArr = [];
  while (reducedNum > 0) {
    for (let basis of basisNum) {
      if (basis <= reducedNum) {
        let [floor, res] = [Math.floor(reducedNum / basis), reducedNum % basis];
        numArr.push(romanNumerals[basis].repeat(floor));
        if (res > 0) {
          reducedNum = res;
        } else {
          reducedNum = 0;
        }
      }
    }
  }
  return numArr.join('');
}

console.log(convertToRoman(36));