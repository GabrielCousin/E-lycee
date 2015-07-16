var AllowSubmit = {

  submit: document.querySelectorAll('input[type="submit"]'),

  init: function() {
    var inputs = document.querySelectorAll('.mdl-textfield__input');
    this.submit[0].setAttribute("disabled", true);

    for (var i = 0, l = inputs.length; i < l; i++) {
      inputs[i].addEventListener('blur', this.allow.bind(this), false);
    }

  },

  allow: function() {
    var self = this;
    setTimeout(function(){ check() }, 300);

    var check = function() {
      var invalid = document.querySelectorAll('.is-invalid');

      if (invalid[0] == null || invalid[0] == 'undefined') {
        self.submit[0].removeAttribute("disabled");
      } else {
        self.submit[0].setAttribute("disabled", true);
      }
    };

  }

}
