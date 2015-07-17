var Allow = {

  submitBtn: document.querySelectorAll('input[type="submit"]'),
  questionCount: 0,

  init: function() {
    var inputs = document.querySelectorAll('.mdl-textfield__input');
    this.submitBtn[0].setAttribute("disabled", true);

    for (var i = 0, l = inputs.length; i < l; i++) {
      inputs[i].addEventListener('blur', this.submit.bind(this), false);
    }

    var addBtn = document.querySelectorAll('.fiche-question-adder');
    this.questionCount = document.querySelectorAll('.fiche-question').length;

    if (this.questionCount >= 5) {
      addBtn[0].setAttribute("disabled", true);
    } else {
      addBtn[0].removeAttribute("disabled");
    }
  },

  submit: function() {
    var self = this;
    setTimeout(function(){ check() }, 300);

    var check = function() {
      var invalid = document.querySelectorAll('.is-invalid');

      if (invalid[0] == null || invalid[0] == 'undefined') {
        self.submitBtn[0].removeAttribute("disabled");
      } else {
        self.submitBtn[0].setAttribute("disabled", true);
      }
    };

  },

}
