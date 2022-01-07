function checkCashRegister(price, cash, cid) {
    let changeRequired = cash - price;
    let totalFunds = Object.values(cid).reduce((sum, arr) => sum += arr[1], 0) >= changeRequired;
    if (sufficientFunds) {
        return "it's possible"
    } else {
        return {
            status: "INSUFFICIENT_FUNDS",
            change: [],
        }
    }
    let change, status;
    /*
        INSUFFICIENT_FUNDS = less than change cash in drawer (cid)
        CLOSED = cid === change,
        OPEN = cid > change and change can be given correclty,
    */
    return {
        status: status,
        change: change,
    };
  }
  
  checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);