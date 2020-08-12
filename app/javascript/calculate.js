
function calculate(){
  
  const item_price = document.getElementById('item_price');


  // item_priceに入力されたらイベント開始
  item_price.addEventListener("change", (e) => {
    // 価格の値を取得する
    const input_price = document.getElementById('item_price').value;
    // 価格が300〜9999999のとき
    if (input_price >= 300 && input_price <= 9999999 ){
      // 出力する場所の定義
      const add_tax_price = document.getElementById('add-tax-price');
      const profit_price = document.getElementById('profit');
      //出力
      add_tax_price.append(input_price - (input_price * 0.9));
      profit_price.append(input_price * 0.9);
    } else {
      add_tax_price.appendChild("NAN");
      profit_price.appendChild("NAN");
    }
    e.preventDefault();
  });
}
window.addEventListener("load", calculate);




