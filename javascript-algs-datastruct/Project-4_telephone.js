function telephoneCheck(str) {
    const regexNum= /^(1(\s)?)?(\(\d{3}\)|\d{3})[- ]?\d{3}[- ]?\d{4}$/;
    return regexNum.test(str);
  }
  
  console.log(telephoneCheck("555-555-5555")); 