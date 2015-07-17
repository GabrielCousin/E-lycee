var MultipleActions = {

  count: '',
  menu: document.getElementById('list-edit-nav'),
  ids: [],
  deleteBtn: document.getElementById('list-items-delete'),
  publishBtn: document.getElementById('list-items-publish'),
  unpublishBtn: document.getElementById('list-items-unpublish'),
  routes : {
      'multiple': 'teacher.article.multiple',
      'postList':  'teacher.articles.view'
  },


  init: function () {
    var checkbox = document.querySelectorAll('.mdl-checkbox__ripple-container');

    for (var i = 0, l = checkbox.length; i < l; i++) {
      checkbox[i].addEventListener('click', this.menuVisibility.bind(this), false);
    };
      var app = this ;
    if (this.ids !== []) {
      this.deleteBtn.addEventListener('click', function(){ app.multipleAction('DELETE')}, false);
      this.publishBtn.addEventListener('click',function(){ app.multipleAction('PUBLISH')}, false);
      this.unpublishBtn.addEventListener('click',function(){ app.multipleAction('UNPUBLISH')}, false);
    };
  },

  menuVisibility: function() {
    var self = this;
    setTimeout(function () { toggle() }, 200);

    var toggle = function() {
      self.count = document.querySelectorAll('.is-checked').length;

      if (self.count > 0) {
        self.ids = [];
        self.menu.classList.add('js-isShown');
        self.listing();
      } else {
        self.ids = [];
        self.menu.classList.remove('js-isShown');
      }
    };
  },

  listing: function() {
    var self = this;
    setTimeout(function(){ getId() }, 500);

    var getId = function() {
      list = document.querySelectorAll('.is-selected');

      for (var i = 0, l = list.length ; i < l ; i++) {
        id = list[i].getAttribute("data-id");
        self.ids.push(id);
      }
      console.log(self.ids);
    }
  },

  initXhr : function(){
    var xhr = null;
    if(window.XMLHttpRequest || window.ActiveXObject){
      if(window.ActiveXObject){
        try{
            xhr = new ActiveXObject("Msxml2.XMLHTTP");
        }catch(e){
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
      }else{
        xhr = new XMLHttpRequest();
      }
    }else{
      console.log("Votre navigateur ne supporte pas l'objet XMLHTTPRequest...");
    }
    return xhr ;
  },

  multipleAction: function(action) {
    console.log(action+" des ids : " + this.ids);
    var ids = this.ids,
        app = this ;
    if (action === "DELETE"){
        if (!confirm('êtes vous sur de vouloir supprimer ces articles ?')) return false;
    }
    var route = Routing.generate(this.routes.multiple,{'action':action,'ids': ids.join(',')});
    var xhr = this.initXhr();

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0)) {
            document.location.href= Routing.generate(app.routes.postList);
        }
    };
    xhr.open('GET', route, true);
    xhr.send(null);
    // this.xhr.addEventListener('readystatechange', this.addSuccess.bind(this), false);
  }

}
