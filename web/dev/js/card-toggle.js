var CardToggle = {

  trigger: document.querySelectorAll('.dashboard-index-card__trigger'),
  card: document.querySelectorAll('.dashboard-index-card'),

  init: function() {

    var self = this;

    for (var i = 0, l = this.trigger.length; i < l; i++) {
      this.trigger[i].addEventListener('click', function() {
        self.toggle(this.getAttribute('data-id'));
      }, false);
    }
  },

  toggle: function(id) {
    this.card[id].classList.toggle('js-isExpanded');
  }

}
