var Loading = {
  loader: document.getElementById('loader'),

  show: function() {
    this.loader.classList.add('js-isActive');
  },

  hide: function() {
    this.loader.classList.remove('js-isActive');
  }
}
