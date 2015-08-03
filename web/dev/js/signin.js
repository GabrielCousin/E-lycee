var SignIn = {
  xhr: null,
  modal: document.getElementById('modal'),
  content: document.getElementById('modalContent'),

  init: function() {
    var modalSwitch = document.querySelectorAll('.js-modalSwitch');

    for (var i = 0, l = modalSwitch.length; i < l; i++) {
      modalSwitch[i].addEventListener('click', this.toggle.bind(this), false);
    }

  },

  toggle: function() {
    if (!this.modal.classList.contains('js-isShown')) {
      this.add();
    } else {
      this.modal.classList.remove('js-isShown');
    };
  },

  add: function() {
    var route = Routing.generate('user.ajax.login', true);
    Loading.show();
    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(null);
    this.xhr.addEventListener('readystatechange', this.addSuccess.bind(this), false);
  },

  addSuccess: function(e) {
    if(this.xhr.readyState == 4 && this.xhr.status == 200) {
      Loading.hide();
      this.modal.classList.add('js-isShown');
      var response = JSON.parse(this.xhr.responseText);
      this.content.innerHTML = response.loginForm;
      componentHandler.upgradeDom();
    }
  }

};
