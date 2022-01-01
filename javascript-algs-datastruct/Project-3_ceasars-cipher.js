function rot13(str) {
  const bounds = {
    min: 65, // A
    max: 90, // Z
  };
  console.log(String.fromCharCode(bounds.min), String.fromCharCode(bounds.max));
  return str.split('').map(letter => {
    const origLetter = letter.charCodeAt();
    if (bounds.min > origLetter || bounds.max < origLetter) { 
      return String.fromCharCode(origLetter);
    } else {
      return String.fromCharCode(origLetter + 13 > bounds.max 
        ? bounds.min + (origLetter + 12 - bounds.max)
        : origLetter + 13);
    }
  }).join('');
}

console.log(rot13("SERR PBQR PNZC"));
console.log(rot13("SERR CVMMN!"));
console.log(rot13("SERR YBIR?"));
console.log(rot13("GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT."));