function calculate(){

  const item_price = document.getElementsByClassName('item_price').value;
  // item_priceに入力されたらイベント開始
  item_price.addEventListener("change", () => {
    // 販売利益の定義
    const profit = (item_price * 0.9);
    // 手数料の定義
    const tax = (item_price - profit);
    // 価格が300〜9999999のとき
    if (item_price >= 300 && item_price <= 9999999 ){
      add_tax_price = document.getElementById('add-tax-price');
      profit_price = document.getElementById('profit');
      //出力
      add_tax_price.appendChild(tax);
      profit_price.appendChild(profit);
    } else {
      ('add-tax-price').appendChild("--");
      ('profit').appendChild("--");
    }
  });
}


// element1 = document.getElementById('add-tax-price');
// element2 = document.getElementById('profit');
// ('add-tax-price').append(tax);
// ('profit').append(profit);




