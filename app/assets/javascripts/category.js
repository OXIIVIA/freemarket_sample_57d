window.addEventListener("turbolinks:load", function() {
  function appendOption(category) {
    var html = `<option value="${category.id}">${category.name}</option>`;
   return html;
   }
  // 親カテゴリー選択後のイベント
  $("#parent_category").on("change", function(){
    var parent_id = $("#parent_category").val();
    $.ajax({
        url: "sell/get_category_children",
        type: "GET",
        data: { parent_id: parent_id },
        dataType: "json"
      })
    .done(function(children) {
      var insertHTML = "";
      $ .each(children,function(i,val) {
        insertHTML += appendOption(val);
      })
      var childHtml = "";
          childHtml = `<div id ="children_category" >
                    <div class="select--wrap">
                      <select class="select--wrap__category" id="child_category" name = "">
                      <option value="">---</option>
                       ${insertHTML}    
                      </select>
                      <div class="fa-down-icon">
                       <i class="fa fa-chevron-down"></i>
                      </div>
                    </div>
                 </div>`; 
      $("#children_category").remove();                     
      $('#select-wrap-category').append(childHtml);
     })
      // 子供カテゴリー選択後のイベント
    $(document).on("change", "#child_category", function(){
      var child_id = $("#child_category").val();
      console.log(child_id);
      $.ajax({
        url: "sell/get_category_grandchildren",
        type: "GET",
        data: { child_id : child_id },
        dataType: "json"
      })
    .done(function(grandchildren) {
      var   insertHTML = "";
      $ .each(grandchildren,function(i,val) {
             insertHTML += appendOption(val);
      })
      var grandchildrenHtml = "";
          grandchildrenHtml = `<div id ="grandchildren_category" >
                             <div class="select--wrap">
                                <select class="select--wrap__category" id="grandchild_category" name = "item [category_id]">
                                  <option value="">---</option>
                                  ${insertHTML}    
                                </select>
                                <div class="fa-down-icon">
                                 <i class="fa fa-chevron-down"></i>
                                </div>
                             </div>
                      </div>`; 
      $("#grandchildren_category").remove();                     
      $('#select-wrap-category').append(grandchildrenHtml);
     })
     .fail(function() {
       alert("エラーです")
      }); 
    })
  })
}) 

