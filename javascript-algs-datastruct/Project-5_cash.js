function checkCashRegister(price, cash, cid) {
    let changeRequired = cash - price;
    let totalFunds = Object.values(cid).reduce((sum, arr) => sum += arr[1], 0);
    if (totalFunds < changeRequired) {
        return {
            status: "INSUFFICIENT_FUNDS",
            change: [],
        };
    } else if (totalFunds === changeRequired){
        return {
            status: "CLOSED",
            change: cid,
        };
    } else {
        console.log(changeRequired)
        for (let i = cid.length-1; i >= 0; i--) {
            console.log(cid[i]);
        }
        return "enough cash";
    }
  }
  
  console.log(checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]));