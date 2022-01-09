function checkCashRegister(price, cash, cid) {
    const moneyNames = {
        "ONE HUNDRED": 100,
        "TWENTY": 20,
        "TEN": 10,
        "FIVE": 5,
        "ONE": 1,
        "QUARTER": 0.25,
        "DIME": 0.1,
        "NICKEL": 0.05,
        "PENNY": 0.01,
    };
    let changeRequired = cash - price;
    const totalFunds = Object.values(cid).reduce((sum, arr) => sum += arr[1], 0);
    let sortedCID = cid.sort((a, b) => moneyNames[b[0]] - moneyNames[a[0]]);
    
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
        let returnedCash = [];
        for (let i = 0; i <= sortedCID.length - 1; i++) {
            let [key, amount] = sortedCID[i];
            let numUnits = Math.floor(changeRequired / moneyNames[key]);
            if (changeRequired > 0 && numUnits > 0) {
                let returnedAmount = Math.min(numUnits * moneyNames[key], amount);
                returnedCash.push([key, returnedAmount]);
                changeRequired = Math.round(
                    (changeRequired - returnedAmount) * 100) / 100;
            };
        };
        console.log(changeRequired)
        return {status: "OPEN", change: returnedCash};
    }
  }
  
  console.log(checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]));
  console.log(checkCashRegister(3.26, 100, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]))