window.addEventListener("turbolinks:load", function() {  

  // 触ったところをアクティブ状態にする＆次の階層のカテゴリーを表示
  function showChild(target, children_target) {
    $(target).addClass("active-list");
    $(target)
      .children(children_target)
      .show();
  }

  // 離れたところを非アクティブ状態にする＆次の階層のカテゴリーを隠す
  function hideChild(target, children_target) {
    $(target).removeClass("active-list");
    $(target)
      .children(children_target)
      .hide();
  }

  // カテゴリー一覧にマウスが乗ったとき
  $("#category").hover(
    function() {
      // 今触ったところをアクティブ状態にする＆親カテゴリーを表示
      $(this).addClass("active-list");
      $(".category").show();
    },
    function() {
      // 今離れたところを非アクティブ状態にする＆親カテゴリーを隠す
      $(this).removeClass("active-list");
      $(".category").hide();
    }
  );

  // 親カテゴリーにマウスが乗ったとき
  $(".category-list__parent__item").hover(
    function() {
      showChild(this, ".category-list__child");
    },
    function() {
      hideChild(this, ".category-list__child");
    }
  );

  // 子カテゴリーにマウスが乗ったとき
  $(".category-list__child__item").hover(
    function() {
      showChild(this, ".category-list__grand__child");
    },
    function() {
      hideChild(this, ".category-list__grand__child");
    }
  );
});