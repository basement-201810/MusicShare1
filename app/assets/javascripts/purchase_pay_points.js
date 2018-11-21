//var hello = 'Hello World';
//alert(hello);





$(function(){
  $('input','.pay_points_field').keyup(function(){
    var numA = 500;                           //⬅️??????
    var numB = $('input:eq(1)','.pay_points_field').val();
    
    //parseIntで文字列を数値に
    numA = parseInt(numA);
    numB = parseInt(numB);
    
    //左側の入力値が数値では無い場合の処理
    //if(!numA){
    //  //計算結果表示のinput内を削除
    //  $('input:eq(2)','.demo3').val('');
    //  return false;
    //};

    //右側の入力値が数値では無い場合の処理
    if(!numB){
      //計算結果表示のinput内を削除
      $('input:eq(2)','.pay_points_field').val('');
      return false;
    };
    $('input:eq(2)','.pay_points_field').val(numA+numB);
  });
});

