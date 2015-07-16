var MultipleActions = {

  count: '',
  menu: document.getElementById('list-edit-nav'),
  ids: [],
  deleteBtn: document.getElementById('list-items-delete'),
  publishBtn: document.getElementById('list-items-publish'),
  unpublishBtn: document.getElementById('list-items-unpublish'),

  init: function () {
    var checkbox = document.querySelectorAll('.mdl-checkbox__ripple-container');

    for (var i = 0, l = checkbox.length; i < l; i++) {
      checkbox[i].addEventListener('click', this.menuVisibility.bind(this), false);
    };

    if (this.ids !== []) {
      this.deleteBtn.addEventListener('click', this.delete.bind(this), false);
      this.publishBtn.addEventListener('click', this.publish.bind(this), false);
      this.unpublishBtn.addEventListener('click', this.unpublish.bind(this), false);
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

  unpublish: function() {
    console.log("dépublication des ids : " + this.ids);
    var route = Routing.generate('teacher.article.unpublishMultiple', true);
    console.log(route);

    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(this.ids);
    // this.xhr.addEventListener('readystatechange', this.addSuccess.bind(this), false);
  },

  publish: function() {
    console.log("publication des ids : " + this.ids);
    var route = Routing.generate('teacher.article.publishMultiple', true);
    console.log(route);

    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(this.ids);
    // this.xhr.addEventListener('readystatechange', this.addSuccess.bind(this), false);
  },

  delete: function() {
    console.log("suppressions des ids: " + this.ids);
    var route = Routing.generate('teacher.article.deleteMultiple', true);
    console.log(route);

    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(this.ids);
    // this.xhr.addEventListener('readystatechange', this.addSuccess.bind(this), false);
  }

}
