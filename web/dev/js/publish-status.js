var publishStatus = {

  xhr: null,

  init: function() {
    this.deleters = document.querySelectorAll('.btn-deleteItem');
    this.switchs = document.querySelectorAll('.btn-editPublish');

    var app = this;

    for (var i = 0, l = this.deleters.length; i < l; i++) {
      this.deleters[i].addEventListener('click', function(){ app.delete(this.getAttribute('data-id'), this.getAttribute('data-type'))}, false);
    };

    for (var i = 0, l = this.switchs.length; i < l; i++) {
      this.switchs[i].addEventListener('click', function(){ app.switch(this.getAttribute('data-id'), this.getAttribute('data-type'))}, false);
    };
  },

  switch: function(id, type) {
    var self = this;

    switch(type) {
      case "post":
        var route = Routing.generate('teacher.article.editStatus', {id : id}, true)
        break;
      case "fiche":
        var route = Routing.generate('teacher.fiche.editStatus', {id : id}, true)
        break;
    }

    Loading.show();
    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(null);
    this.xhr.addEventListener('readystatechange', function(e) {
      if(self.xhr.readyState == 4 && self.xhr.status == 200) {
        var response = JSON.parse(self.xhr.responseText);
        var target = document.querySelectorAll('.btn-editPublish[data-id="' + id + '"]')[0];
        Loading.hide();
        target.innerHTML = response.message;
      }
    }, false);
  },

  delete: function(id, type) {
    var valid = confirm('Êtes-vous sûr de vouloir supprimer cet item ?');
    if (valid) {
      switch(type) {
        case "post":
          document.location = Routing.generate('teacher.article.delete',{'id':id})
          break;
        case "fiche":
          document.location = Routing.generate('teacher.fiche.delete',{'id':id})
          break;
      }
    }
  }

}
