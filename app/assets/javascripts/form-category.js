// window.addEventListener("turbolinks:load", function() {
// // セレクトボックスの削除
// function remove_selectBox(target) {
//   // 親カテゴリーを変更した場合
//   if (target == "parent") {
//     $("#children_wrapper").remove();
//   }
//   // 親または子カテゴリーを変更した場合
//   if (target == "parent" || target == "child") {
//     $("#grandchildren_wrapper").remove();
//   }
//   // 共通
//   $("#size_wrapper").remove();
//   $("#brand_wrapper").remove();
// }

// // カテゴリーセレクトボックスのオプションを作成
// function appendOption(category) {
//   var html = `<option value="${category.id}">${category.name}</option>`;
//   return html;
// }

// // 子カテゴリーの表示作成
// function appendChidrenBox(insertHTML) {
//   var childSelectHtml = "";
//   childSelectHtml = `<div class="buy__container__main__wrapper__detail__select__category__select" id= "children_wrapper">
//                         <select id="child_category" name="" style="margin-bottom: 10px;">
//                         <option value="---" data-category="---">---</option>
//                           ${insertHTML}
//                         </select>
//                       </div>`;
//   $("#category-insert").append(childSelectHtml);
// }
// // 孫カテゴリーの表示作成
// function appendGrandchidrenBox(insertHTML) {
//   var grandchildSelectHtml = "";
//   grandchildSelectHtml = `<div class="buy__container__main__wrapper__detail__select__category__select" id= "grandchildren_wrapper">
//                               <select id="grandchild_category" name="item[category_id]">
//                                 <option value="---">---</option>
//                                 ${insertHTML}
//                               </select>
//                             </div>`;
//   $("#category-insert").append(grandchildSelectHtml);
// }

// // 子カテゴリーのセレクトボックスを作成
// function append_children(children) {
//   remove_selectBox("parent");
//   var insertHTML = "";
//   children.forEach(function(child) {
//     insertHTML += appendOption(child);
//   });
//   appendChidrenBox(insertHTML);
// }

// // 孫カテゴリーのセレクトボックスを作成
// function append_grandchildren(grandchildren) {
//   remove_selectBox("child");
//   var insertHTML = "";
//   grandchildren.forEach(function(grandchild) {
//     insertHTML += appendOption(grandchild);
//   });
//   appendGrandchidrenBox(insertHTML);
// }

// // 共通メッセージ
// function alert_message() {
//   alert("カテゴリー取得に失敗しました");
// }

// // 商品編集ページ読み込み時、カテゴリーセレクトボックスの全てのトリガーを発火させる
// //  DOMが表示される前に次のajax処理が動いてしまう可能性を考慮して、各処理はdoneで順番に行う
// if (window.location.href.match(/\/items\/\d+\/edit/)) {
//   // 最初に商品のカテゴリーを取得
//   $.ajax({
//     url: "api/categories",
//     type: "GET",
//     dataType: "json"
//   })
//     .done(function(data) {
//       $("#parent_category").trigger("change");
//       $("#parent_category").val(data.parent_id); // 親カテゴリーのidをセット

//       // 子カテゴリー作成
//       var parentCategory = $("#parent_category").val(); //選択された親カテゴリーの名前を取得
//       if (parentCategory != "---") {
//         //親カテゴリーが初期値でないことを確認
//         $.ajax({
//           url: "get_category_children",
//           type: "GET",
//           data: { parent_id: parentCategory },
//           dataType: "json"
//         })
//           .done(function(children) {
//             append_children(children);
//             $("#child_category").val(data.child_id); // 子カテゴリーのidをセット
//             var childId = $("#child_category").val(); //選択された子カテゴリーのidを取得
//             if (childId != "---") {
//               //子カテゴリーが初期値でないことを確認
//               $.ajax({
//                 url: "get_category_grandchildren",
//                 type: "GET",
//                 data: { child_id: childId },
//                 dataType: "json"
//               })
//                 .done(function(grandchildren) {
//                   if (grandchildren.length != 0) {
//                     append_grandchildren(grandchildren);
//                     $("#grandchild_category").val(data.grandChild_id); // 子カテゴリーのidをセット
//                   }
//                 })
//                 // 孫カテゴリーの取得失敗
//                 .fail(function() {
//                   alert_message();
//                 });
//             } else {
//               remove_selectBox("child");
//             }
//           })
//           // 子カテゴリーの取得失敗
//           .fail(function() {
//             alert_message();
//           });
//       } else {
//         remove_selectBox("parent");
//       }
//     })
//     .fail(function() {
//       alert_message();
//     });
// }

// // 親カテゴリー選択後のイベント
// $("#parent_category").on("change", function() {
//   var parentCategory = $("#parent_category").val(); //選択された親カテゴリーの名前を取得
//   if (parentCategory != "---") {
//     //親カテゴリーが初期値でないことを確認
//     $.ajax({
//       url: "get_category_children",
//       type: "GET",
//       data: { parent_id: parentCategory },
//       dataType: "json"
//     })
//       .done(function(children) {
//         append_children(children);
//       })
//       .fail(function() {
//         alert_message();
//       });
//   } else {
//     remove_selectBox("parent");
//   }
// });

// // 子カテゴリー選択後のイベント
// $("#category-insert").on("change", "#child_category", function() {
//   var childId = $("#child_category").val(); //選択された子カテゴリーのidを取得
//   if (childId != "---") {
//     //子カテゴリーが初期値でないことを確認
//     $.ajax({
//       url: "get_category_grandchildren",
//       type: "GET",
//       data: { child_id: childId },
//       dataType: "json"
//     })
//       .done(function(grandchildren) {
//         if (grandchildren.length != 0) {
//           append_grandchildren(grandchildren);
//         }
//       })
//       .fail(function() {
//         alert_message();
//       });
//   } else {
//     remove_selectBox("child");
//   }
// });

// $(function() {
//   // サイズセレクトボックスのオプションを作成
//   function appendSizeOption(size) {
//     var html = `<option value="${size.id}">${size.name}</option>`;
//     return html;
//   }
//   // サイズ・ブランド入力欄の表示作成
//   function appendSizeBox(insertHTML) {
//     var sizeSelectHtml = "";
//     sizeSelectHtml = `<div class="sell-inner__form__content__right__genre_size" id= "size">
//                         <label>サイズ</label>
//                         <span>必須</span>
//                         <div class="sell-inner__form__content__right__genre_select" id= "size_wrapper">
//                           <i class="fa fa-chevron-down"></i>
//                           <select id="size" name="item[size_id]">
//                           <option value="---">---</option>
//                             ${insertHTML}
//                           </select>
//                         </div>
//                       </div>`;
//     $("#sell-inner__form__content__right__genre_hogehoge").append(
//       sizeSelectHtml
//     );
//   }
//   // 孫カテゴリー選択後のイベント
//   $("#sell-inner__form__content__right__genre_hogehoge").on(
//     "change",
//     "#grandchild_category",
//     function() {
//       var grandchildId = $("#grandchild_category option:selected").data(
//         "category"
//       ); //選択された孫カテゴリーのidを取得
//       if (grandchildId != "---") {
//         //孫カテゴリーが初期値でないことを確認
//         $.ajax({
//           url: "get_size",
//           type: "GET",
//           data: { grandchild_id: grandchildId },
//           dataType: "json"
//         })
//           .done(function(sizes) {
//             remove_selectBox("grandChild");
//             if (sizes.length != 0) {
//               var insertHTML = "";
//               sizes.forEach(function(size) {
//                 insertHTML += appendSizeOption(size);
//               });
//               appendSizeBox(insertHTML);
//             }
//           })
//           .fail(function() {
//             alert("サイズ取得に失敗しました");
//           });
//       } else {
//         remove_selectBox("grandChild");
//       }
//     }
//   );
// });
// });