$(function(){

  $("#search-field").on('keyup', function(e){
    $.ajax({
      url: "/projects/search",
      method: "POST",
      data: {
        "q": {
          "title_cont": $("#search-field").val()
        }
      },
      dataType: 'html'
    }).done(function(data) {
      $("#projects").html(data);
    })
  });
})
