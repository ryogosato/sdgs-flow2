$(function(){
  function buildHTML(message){
    var html =
      `<div class="card">
        <div class="card-body">
          <h5 class="card-content">${message.content}</h5>
          <div class="d-flex justify-content-around">
            <div class="card-user">
              ${message.user_name}
            </div>
          </div>
        </div>
      </div>
      <h1>👉</h1>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data);
      var html = buildHTML(data);
      $('.row.c').append(html);
      $('.row.c').animate({ scrollTop: $('.row.c')[0].scrollHeight});
      $('form')[0].reset();
      $('.btn.btn-success').prop( 'disabled', false );
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
})
});