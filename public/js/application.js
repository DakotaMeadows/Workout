$(document).ready(function() {

  $('#new').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      url: $target.attr('action'),
      type: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response) {
      $('#list').append(response);
    });
  });

  // $('#delete').submit(function(event) {
  //   event.preventDefault();
  //   $target = $(event.target);

  //   $.ajax({
  //     url: $target.attr('action'),
  //     type: "POST",
  //     dataType: "json",
  //     data: {"_method":"delete"}
  //   }).done(function(response) {
  //     console.log(response);
  //     $target.parent().remove();
  //   })
  // })

});
