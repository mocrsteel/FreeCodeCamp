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
  const recurseNum = (num) => {
    for (let basis of basisNum) {
      if (basis <= num) {
        let [quot, res] = [Math.floor(num / basis), num % basis]
        if (quot >= 0 && red > 0) {
          [quot, res] = recurseNum
        }
      }
    }
  }  
  
  for (let basis of basisNum) {
      console.log(basis + ' quotient = ' + Math.floor(num / basis) + ' with residual = ' + num % basis)
  }
  return basisNum;
}

console.log(convertToRoman(36));