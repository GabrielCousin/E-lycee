var FicheCreate = {
  submitBtn: document.querySelectorAll('input[type="submit"]'),
  questionCount: 0,

  collectionHolder: document.getElementsByClassName('form-choices')[0],
  adderBtn: document.getElementById('adder'),

  init: function() {
    var app = this;

    this.adderBtn.addEventListener('click', function(e) {
      e.preventDefault();
      app.addForm();
      app.fieldLimit();
    }, false);

  },

  addForm: function() {
    var prototype = this.collectionHolder.getAttribute('data-prototype');
    var newForm = prototype.replace(/__name__/g, this.collectionHolder.children.length);

    var form = document.createElement('li');
    form.classList.add('fiche-question');
    form.innerHTML = newForm;

    this.collectionHolder.appendChild(form);

    this.removeForm();
    componentHandler.upgradeDom();
  },

  removeForm: function() {
    var removeBtn = document.querySelectorAll('.remover');

    for (var i = 0, l = removeBtn.length; i < l; i++) {
      removeBtn[i].addEventListener('click', function(e) {
        e.preventDefault();
        var id = this.getAttribute('data-id');
        var target = document.getElementById('form' + id).parentNode;
        target.parentNode.removeChild(target);
        componentHandler.upgradeDom();
      }, false);
    }

  },

  fieldLimit: function() {
    var inputs = document.querySelectorAll('.mdl-textfield__input');
    this.submitBtn[0].setAttribute('disabled', true);

    for (var i = 0, l = inputs.length; i < l; i++) {
      inputs[i].addEventListener('blur', this.submit.bind(this), false);
    }

    this.questionCount = document.querySelectorAll('.fiche-question').length;

    if (this.questionCount >= 5) {
      this.adderBtn.setAttribute("disabled", true);
    } else {
      this.adderBtn.removeAttribute("disabled");
    }
  },

  submit: function() {
    var self = this;
    setTimeout(function() { check() }, 300);

    var check = function() {
      var invalid = document.querySelectorAll('.is-invalid');

      if (invalid[0] == null || invalid[0] == 'undefined') {
        self.submitBtn[0].removeAttribute('disabled');
      } else {
        self.submitBtn[0].setAttribute('disabled', true);
      }
    };
  },
}
