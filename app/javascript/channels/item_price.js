window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');// 入力価格のタグID名
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    totalPrice_fee = Math.floor(inputValue * 0.1); // 合計販売手数料(入力数値＊手数料割合を小数点以下切り捨て)
    totalProfit = Math.floor( inputValue - totalPrice_fee); // 合計販売利益（入力数値-手数料割合を小数点以下切り捨て）

    const addTax  = document.getElementById('add-tax-price');// 販売手数料
    addTax.innerHTML = totalPrice_fee;
  
    const priceProfit = document.getElementById('profit');
    priceProfit.innerHTML = totalProfit ;// 販売利益
})
});

