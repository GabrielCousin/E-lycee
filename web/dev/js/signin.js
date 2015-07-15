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
      this.modal.classList.toggle('js-isShown');
    } else {
      this.modal.classList.toggle('js-isShown');
    };

  },

  add: function() {
    var route = Routing.generate('user.login', true);
    console.log(route);

    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(null);
    this.xhr.addEventListener('readystatechange', this.addSuccess.bind(this), false);
  },

  addSuccess: function(e) {
    if(this.xhr.readyState == 4 && this.xhr.status == 200) {
      var response = JSON.parse(this.xhr.responseText);
      this.content.innerHTML = response.poney;
      componentHandler.upgradeDom();
    }
  }

};
