// $(function () {
//   $("#payment_form").submit(function (e) {
//     e.preventDefault();

//     var form = $("#payment_form")
//     var card = {
//       number: $("#card_number").val(),
//       cvc: $("#cvc").val(),
//       exp_month: $("#exp_month").val(),
//       exp_year: $("#exp_year").val()
//     };

//     Payjp.setPublicKey('pk_test_c74d786bcc22c69d769c3d96');

//     Payjp.createToken(card, function (status, response) {
//       if (status == 200) {
//         $("#card_number").removeAttr("name");
//         $("#cvc").removeAttr("name");
//         $("#exp_month").removeAttr("name");
//         $("#exp_year").removeAttr("name");

//         var token = response.id;

//         form.append($('<input type="hidden" name="payjpToken" />').val(token));
//         form.get(0).submit();
//       } else {
//         alert(response.error.message);
//       }
//     });

//   });
// });

$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_91567a8411019873bff20217');
  $(document).on("click", "#token_submit", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        card_number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_expiration_date_1i").val(),
        exp_year: $("#payment_expiration_date_2i").val(),
    };

    console.log()
    // Payjp.createToken(card, function(s, response) {
    //   // if (response.error) {
    //   //   alert('トークン作成エラー発生');
    //   // }
    //   // else {
    //   //   $(".number").removeAttr("name");
    //   //   $(".cvc").removeAttr("name");
    //   //   $(".exp_month").removeAttr("name");
    //   //   $(".exp_year").removeAttr("name");
    //   //   var token = response.id;

    //   //   form.append($('<input type="hidden" name="payjpToken" />').val(token));
    //   //   form.get(0).submit();
    //   // }
    // });
  });
});