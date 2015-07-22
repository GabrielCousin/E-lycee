var Pagination = {
  content: document.getElementById('posts-wrapper'),
  loadMore: document.querySelectorAll('.load-more-btn'),

  init: function() {
    this.loadMore[0].addEventListener('click', this.check.bind(this), false);
  },

  check: function() {
    this.loadMore[0].setAttribute('disabled', 'true');

    if (this.current < this.max) {
      this.load();
    } else {
      this.loadMore[0].innerHTML = 'Tous les articles sont chargés';
    }
  },

  load: function() {
    this.pageToLoad = this.current + 1;
    var route = Routing.generate('public.news.ajax', { page: this.pageToLoad }, true);
    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(null);
    this.xhr.addEventListener('readystatechange', this.success.bind(this), false);
  },

  success: function(e) {
    if(this.xhr.readyState == 4 && this.xhr.status == 200) {
      var response = JSON.parse(this.xhr.responseText);
      this.content.innerHTML += response.articleSection;
      componentHandler.upgradeDom();

      this.current = this.pageToLoad;
      this.loadMore[0].removeAttribute('disabled');
    }
  }

}
