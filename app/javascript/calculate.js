
function calculate(){
  
  const item_price = document.getElementById('item_price');


  // item_priceに入力されたらイベント開始



  item_price.addEventListener("change", (e) => {
    // 価格の値を取得する
    const input_price = document.getElementById('item_price').value;
    // 出力する場所の定義
    const add_tax_price = document.getElementById('add-tax-price');
    const profit_price = document.getElementById('profit');
    // 価格が半角数値のみの場合
    if (input_price.match(/[0-9]/)){
      //出力
      add_tax_price.append(input_price - (input_price * 0.9));
      profit_price.append(input_price * 0.9);
    } else {
      add_tax_price.append("NAN");
      profit_price.append("NAN");
    }
    e.preventDefault();
  });



}
window.addEventListener("load", calculate);



rrrrrrrrrrrr
