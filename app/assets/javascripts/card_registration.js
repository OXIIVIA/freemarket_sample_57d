$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_91567a8411019873bff20217');
  $(document).on("click", "#token_submit", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_expiration_date_1i").val(),
        exp_year: $("#payment_expiration_date_2i").val(),
    };

    console.log(card)
    Payjp.createToken(card, function(status, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
      }
      else {
        $("#payment_card_no").removeAttr("name");
        $("#payment_card_cvc").removeAttr("name");
        $("#payment_expiration_date_1i").removeAttr("name");
        $("#payment_expiration_date_2i").removeAttr("name");
        var token = response.id;

        form.append($('<input type="hidden" name="payjp-token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});