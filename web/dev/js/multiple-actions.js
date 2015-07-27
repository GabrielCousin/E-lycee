var MultipleActions = {

  count: '',
  menu: document.getElementById('list-edit-nav'),
  ids: [],
  deleteBtn: document.getElementById('list-items-delete'),
  publishBtn: document.getElementById('list-items-publish'),
  unpublishBtn: document.getElementById('list-items-unpublish'),
  routes : {
    'post' :{
      'multipleAction': 'teacher.article.multiple',
      'redirect': 'teacher.articles.view',
    },
    'fiche':{
      'multipleAction': 'teacher.fiches.multiple',
      'redirect': 'teacher.fiches.home',
    }
  },
  type: '',

  init: function () {
    var checkbox = document.querySelectorAll('.mdl-checkbox__ripple-container');
    this.type = this.menu.dataset.type ;
    for (var i = 0, l = checkbox.length; i < l; i++) {
      checkbox[i].addEventListener('click', this.menuVisibility.bind(this), false);
    };
    var app = this;
    if (this.ids !== []) {
      this.deleteBtn.addEventListener('click', function(){ app.multipleAction('DELETE',this.type)}, false);
      this.publishBtn.addEventListener('click',function(){ app.multipleAction('PUBLISH',this.type)}, false);
      this.unpublishBtn.addEventListener('click',function(){ app.multipleAction('UNPUBLISH',this.type)}, false);
    };
  },

  menuVisibility: function() {
    var self = this;
    setTimeout(function () {
      toggle()
    }, 200);

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
    setTimeout(function(){
      getId()
    }, 500);

    var getId = function() {
      list = document.querySelectorAll('.is-selected');

      for (var i = 0, l = list.length ; i < l ; i++) {
        id = list[i].getAttribute("data-id");
        self.ids.push(id);
      }

    }
  },

  initXhr : function(){
    var xhr = null;
    if (window.XMLHttpRequest || window.ActiveXObject) {
      if (window.ActiveXObject) {
        try{
            xhr = new ActiveXObject("Msxml2.XMLHTTP");
        } catch(e) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
      } else {
        xhr = new XMLHttpRequest();
      }
    } else {
      console.log("Votre navigateur ne supporte pas l'objet XMLHTTPRequest...");
    }
    return xhr;
  },

  multipleAction: function(action) {
    console.log(action+" des ids : " + this.ids);
    var ids = this.ids,
        app = this ;
    if (action === "DELETE") {
      var lebelType = (type === 'post') ? "articles" : "fiches";
      if (!confirm('Êtes-vous sûr de vouloir supprimer ces ' + labelType + ' ?')) return false;
    }
    var route = Routing.generate(this.routes[app.type].multipleAction,{'action':action,'ids': ids.join(',')});
    var xhr = this.initXhr();

    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0)) {
          document.location.href= Routing.generate(app.routes[app.type].redirect);
      }
    };
    xhr.open('GET', route, true);
    xhr.send(null);
  }

}
