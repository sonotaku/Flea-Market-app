const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);   // テスト公開鍵を貼り付け、PAY.JPを読みこむ
  // フォームの情報を取得
  const form = document.getElementById('charge-form');
  // 送信されたらイベント開始！
  form.addEventListener("submit", (e) => {
    //フォーム送信処理をキャンセルする
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // 変数cardにカード情報を代入する
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`
    };


        // トークン作成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        // 生成されたトークンを変数tokenに代入する
        const token = response.id;
        // トークンの値が入ってるHTML要素を取得する
        const renderDom = document.getElementById("charge-form");
        // 生成するHTMLを定義する
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        // フォームの最後にHTMLを生成、挿入する
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        // 入力された情報（カード）の値を削除する
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        // フォームを送信する
        document.getElementById("charge-form").submit();
        // フォームの入力内容をリセットする
        document.getElementById("charge-form").reset();
        alert("購入が完了しました")
      } else {
      }
    });
  });
};
window.addEventListener("load", pay);