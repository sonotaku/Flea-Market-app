const pay = () => {
  Payjp.setPublicKey("pk_test_2091fa91a443d4f38451feb3");   // テスト公開鍵を貼り付け、PAY.JPを読みこむ
  // フォームの情報を取得
  const form = document.getElementById('change-form');
  // イベントの開始！
  form.addEventListener("submit", (e) => {
    
  })
}

window.addEventListener("load", pay);