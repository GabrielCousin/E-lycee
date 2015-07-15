$('a.editPublish').on('click', function(e) {
  e.preventDefault();
  var id = $(this).data('id');
  if ($(this).data('type')=== 'post')
    var urlAjax = ( Routing.generate('teacher.article.editStatus',{'id':id}) );
  else if($(this).data('type')=== 'fiche')
    var urlAjax = ( Routing.generate('teacher.fiche.editStatus',{'id':id}) );

  $.ajax({
    url: urlAjax
  }).done(function(response, status) {
    console.log("Le post " + id + " est maintenant " + response.message);
    $('.editPublish[data-id=' + id + ']').html(response.message);
    }).fail(function(error,status){
      console.alert("erreur : "+error,status);
    })
});

$('a.deleteItem').on('click', function(e) {
  e.preventDefault();
  var id = $(this).data('id');
  var type = $(this).data('type');
  var valid = confirm('êtes vous sur de vouloir supprimer cet article ? ');
  if (valid) {
    // redirection et non appel ajax comme précédemment
    if (type =="post")
      document.location.href = Routing.generate('teacher.article.delete',{'id':id});
    else if (type === "fiche")
    document.location.href = Routing.generate('teacher.fiche.delete',{'id':id});
  }
});
